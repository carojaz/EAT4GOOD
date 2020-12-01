class CreateBreakfasts < ActiveRecord::Migration[6.0]
  def change
    create_table :breakfasts do |t|
      t.boolean :local, default: false
      t.string :picture_path
      t.references :foodtype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
