class DropWeeeksTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :weeks
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
