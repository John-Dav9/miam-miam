class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :difficulty, inclusion: { in: %w[Facile Moyenne Difficile], message: "%{value} n'est pas une difficulté valable !" }

  

  def formatted_ingredients
    ingredients.split(',').map(&:strip).join(', ')
  end
end
