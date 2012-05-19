class Enrollment < ActiveRecord::Base
  validates :student, presence: true
  validates :crowd, presence: true
  belongs_to :student
  belongs_to :crowd
  attr_accessible :student_id, :crowd_id

  def as_json options={}
    super include: [:student, :crowd]
  end
end
