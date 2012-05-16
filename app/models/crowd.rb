class Crowd < ActiveRecord::Base

  attr_accessible :name, :professor_id, :subject_id

  validates :name, presence: true, uniqueness: { scope: [:professor_id,:subject_id] }
  validates :professor, presence: true
  validates :subject, presence: true

  belongs_to :professor
  belongs_to :subject
end
