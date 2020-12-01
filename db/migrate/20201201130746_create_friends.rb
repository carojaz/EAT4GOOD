class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.references :friend1_user, null: false,  foreign_key: { to_table: :users }
      t.references :friend2_user, null: false,  foreign_key: { to_table: :users }
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
