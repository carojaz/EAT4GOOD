class CreateDinners < ActiveRecord::Migration[6.0]
  def change
    create_table :dinners do |t|
      t.boolean :local, default: false
      t.string :picture_path
      t.references :foodtype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
