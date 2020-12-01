class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.integer :veggie
      t.integer :local

      t.timestamps
    end
  end
end
