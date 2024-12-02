class Recettes_propositionController < ApplicationController
  def Proposition
    if request.post?
      ingredients = params[:ingredients]
      difficulty = params[:difficulty]

      # Connect to OpenAI
      client = OpenAI::Client.new
      response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [
            { role: "system", content: "You are a recipe suggestion assistant." },
            { role: "user", content: "Here are some ingredients: #{ingredients}. I want a recipe with #{difficulty} difficulty." }
          ]
        }
      )

      recipe_content = response.dig("choices", 0, "message", "content")

      # Parse response (you can make this more robust)
      @recipe = recipe_content
    end
  end
end
