class RemoveStatusFromDays < ActiveRecord::Migration[6.0]
  def change
    remove_column :days, :status_id, :integer
  end
end
