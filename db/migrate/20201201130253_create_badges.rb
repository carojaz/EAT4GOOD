class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.integer :target
      t.string :name
      t.string :description
      t.string :picture_path

      t.timestamps
    end
  end
end
