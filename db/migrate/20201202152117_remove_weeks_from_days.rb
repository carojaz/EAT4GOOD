class RemoveWeeksFromDays < ActiveRecord::Migration[6.0]
  def change
    remove_column :days, :week_id, :integer
  end
end
