class CreateChallenges < ActiveRecord::Migration[6.0]
  def change
    create_table :challenges do |t|
      t.string :message
      t.integer :nb_days_veggie
      t.integer :nb_days_local

      t.timestamps
    end
  end
end
