class RemoveWeeksAndYearFromDays < ActiveRecord::Migration[6.0]
  def change
    remove_column :days, :nb_week, :integer
    remove_column :days, :year, :integer
  end
end
