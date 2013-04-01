class GoogleTask < ActiveRecord::Base
  attr_accessible :google_id, :user_id, :task_id

  belongs_to :user
  belongs_to :task


  after_create :create_remote_task

  def create_remote_task
     event = ::Event.new(calendar_id: user.google_calendar_id, summary: task.to_s, start_date: task.scheduled_start_date, end_date: task.scheduled_end_date, user: user)
     event.save
     self.google_id = event.id
     save
  end

  def update_date(date = {})
    params = date.merge(calendar_id: user.google_calendar_id, user: user, id: google_id)
    event = ::Event.new(params)
    event.save
  end
end
