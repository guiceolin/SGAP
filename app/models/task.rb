class Task < ActiveRecord::Base
  belongs_to :solution

  validates :description, :presence => true

  attr_accessible :description

  def start
    self.start_date.blank? && !!(self.start_date = Date.today)
  end

  def started?
    start_date.present? && !completed?
  end

  def complete
    self.start_date.present? && !!(self.end_date = Time.now)
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
    CGI.escape("#{description} #{project.end_date}")
  end
end
