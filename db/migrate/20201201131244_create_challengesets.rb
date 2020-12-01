class CreateChallengesets < ActiveRecord::Migration[6.0]
  def change
    create_table :challengesets do |t|
      t.integer :start_date
      t.string :status, default: "pending"
      t.references :challenge, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
