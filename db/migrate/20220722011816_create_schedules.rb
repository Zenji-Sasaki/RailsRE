class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :startDate
      t.datetime :endDate
      t.string :allDay

      t.timestamps
    end
  end
end
