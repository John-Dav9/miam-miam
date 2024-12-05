class RecipesController < ApplicationController
  def index
    @recipes = []
    JSON.parse(session[:recipes]).each do |recipe|
      photo = image(recipe[:title])
      
      title = recipe.keys.first
      steps = recipe[title]["steps"]
      photo = image(title)

      @recipes << {
        title: title,
        steps: steps,
        photo: photo
      }
    end
  end

  def new
  end

  def image(name)
 
      client = OpenAI::Client.new
      response = client.images.generate(parameters: {
        prompt: "A recipe image of #{name}", size: "256x256"
      })
      url = response.dig("data", 0 ,"url")
      url
  end

  def proposition
    if request.post?
      ingredients = params[:ingredients]
      difficulty = params[:difficulty]

      # Traiter la request



      # Connect to OpenAI
      client = OpenAI::Client.new
      response = client.chat(
          parameters: {
              model: "gpt-3.5-turbo",
              messages: [
                  { role: "system", content: PROMPT },
                  { role: "user", content: "J'ai ces ingredients: #{ingredients}. Difficulté #{difficulty}" }
                ]
              }
            )

            recipes_content = response.dig("choices", 0, "message", "content")

            # Parse response (you can make this more robust)

            session[:recipes] = recipes_content
      redirect_to root_path
    end
  end
end

PROMPT = '
          Je vais te fournir une liste d\'ingrédients, avec ou sans quantités, et préciser un niveau de difficulté pour les recettes que je veux obtenir.
          Tu devras me proposer 5 recettes qui correspondent aux critères suivants :

          1. Utilisation des ingrédients fournis : Les recettes doivent inclure les ingrédients spécifiés. Ne pas prendre en compte les condiments.

          2. Sélection par difficulté : Les recettes doivent être adaptées au niveau de difficulté choisi (facile, moyenne ou difficile).

          3. Fournis des étapes claires pour réaliser chaque recette.

        mettre la réponse sous se format :
        [
        {
        "nom de la recette" :  {
            "ingredients" :{
                "pommes" : 2

            },
            {
            "steps" : ["1. Pelez et coupez les pommes en tranches.", "steps2", ...]
            }
        }
        },
        rec2,rec3]
        '
