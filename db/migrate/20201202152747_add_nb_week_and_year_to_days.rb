class AddNbWeekAndYearToDays < ActiveRecord::Migration[6.0]
  def change
    add_column :days, :nb_week, :integer
    add_column :days, :year, :integer
  end
end
