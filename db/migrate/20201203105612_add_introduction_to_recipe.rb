class AddIntroductionToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :introduction, :text
  end
end
