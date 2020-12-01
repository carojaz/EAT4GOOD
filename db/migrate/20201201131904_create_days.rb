class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.references :breakfast, null: false, foreign_key: true
      t.references :lunch, null: false, foreign_key: true
      t.references :dinner, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true

      t.timestamps
    end
  end
end
