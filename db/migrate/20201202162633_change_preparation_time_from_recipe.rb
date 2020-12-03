class ChangePreparationTimeFromRecipe < ActiveRecord::Migration[6.0]
  def change
    change_column :recipes, :preparation_time, :string
  end
end
