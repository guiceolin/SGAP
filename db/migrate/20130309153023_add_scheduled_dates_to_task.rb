class AddScheduledDatesToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :scheduled_start_date, :date
    add_column :tasks, :scheduled_end_date, :date
  end
end
