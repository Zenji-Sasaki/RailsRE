class ChangeDatatypestartDateendDateOfSchedules < ActiveRecord::Migration[7.0]
  def change
      change_column :schedules, :startDate, :date
      change_column :schedules, :endDate, :date
  end
end
