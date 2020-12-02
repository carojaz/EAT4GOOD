class AddNbWeekAndYearToObjectives < ActiveRecord::Migration[6.0]
  def change
    add_column :objectives, :nb_week, :integer
    add_column :objectives, :year, :integer
  end
end
