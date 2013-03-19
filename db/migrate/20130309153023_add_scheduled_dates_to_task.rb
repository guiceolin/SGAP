class AddScheduledDatesToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :scheduled_start_date, :data
    add_column :tasks, :scheduled_end_date, :data
  end
end
