class DropStatusesTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :statuses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
