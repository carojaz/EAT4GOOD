class CreateWeeks < ActiveRecord::Migration[6.0]
  def change
    create_table :weeks do |t|
      t.integer :week_nb
      t.integer :year
      t.integer :counter_veggies_days
      t.integer :counter_locals_days
      t.boolean :veggie_obj_achieved

      t.timestamps
    end
  end
end
