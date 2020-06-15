class CreateCocktails < ActiveRecord::Migration[5.2]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :content
      t.string :ingredient
      t.text :recipe
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
