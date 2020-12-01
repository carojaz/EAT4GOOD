class CreateObjectives < ActiveRecord::Migration[6.0]
  def change
    create_table :objectives do |t|
      t.integer :veggies_days
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
