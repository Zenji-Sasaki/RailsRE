class AddMemoToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :memo, :string
  end
end
