class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.date :date
      t.decimal :max_temp
      t.decimal :average_temp
      t.decimal :min_temp
      t.decimal :average_humidity
      t.decimal :average_visibility
      t.decimal :average_windspeed
      t.decimal :precipitation
    end
  end
end
