class CreateRecettes < ActiveRecord::Migration[7.2]
  def change
    create_table :recettes do |t|
      t.string :nom
      t.string :description
      t.string :categorie
      t.string :durée
      t.string :pays
      t.string :ingredients
      t.string :préparation

      t.timestamps
    end
  end
end
