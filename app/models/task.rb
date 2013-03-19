class Task < ActiveRecord::Base
  belongs_to :solution
  has_many :google_tasks

  validates :description, :presence => true
  after_create :create_google_task

  attr_accessible :description, :scheduled_start_date, :scheduled_end_date

  def create_google_task
    solution.group.students.map do |s|
      s.create_google_task(self)
    end
  end

  def start
    if self.start_date.blank?
      self.start_date = Date.today
      google_tasks.map { |gt| gt.update_date(start_date: start_date.to_s)}
    end
  end

  def started?
    start_date.present? && !completed?
  end

  def complete
    if self.start_date.present?
      self.end_date = Date.today
      google_tasks.map { |gt| gt.update_date(end_date: end_date.to_s) }
    end
  end

  def completed?
    end_date.present?
  end

  def status
    if completed?
      'Finalizada'
    elsif started?
      'Iniciada'
    else
      'Nao iniciada'
    end
  end

  def to_s
    description
  end

  def calendar_string
    CGI.escape("#{description} #{solution.group.enunciation.end_date}")
  end
end
