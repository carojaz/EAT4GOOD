class AddUrlToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :url_photo, :string
  end
end
