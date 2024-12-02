class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.string :nom
      t.string :quantité
      t.references :recettes, null: false, foreign_key: true

      t.timestamps
    end
  end
end
