class CreateFoodtypes < ActiveRecord::Migration[6.0]
  def change
    create_table :foodtypes do |t|
      t.string :name
      t.string :picture_path

      t.timestamps
    end
  end
end
