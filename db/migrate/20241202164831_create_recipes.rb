class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :duration
      t.string :ingredients
      t.string :steps

      t.timestamps
    end
  end
end
