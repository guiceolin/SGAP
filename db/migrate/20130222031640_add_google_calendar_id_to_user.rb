class AddGoogleCalendarIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :google_calendar_id, :string
  end
end
