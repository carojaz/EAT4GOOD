class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :preparation_time
      t.string :ingredients
      t.string :description

      t.timestamps
    end
  end
end
