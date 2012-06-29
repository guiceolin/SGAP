class Crowd < ActiveRecord::Base

  attr_accessible :name, :professor_id, :subject_id, :year, :semester

  validates :name, presence: true, uniqueness: { scope: [:professor_id,:subject_id,:year,:semester] }
  validates :professor, presence: true
  validates :subject, presence: true
  validates :year, presence: true
  validates :semester, presence: true

  belongs_to :professor
  belongs_to :subject
  has_many :enrollments
  has_many :students, :through => :enrollments
  has_many :enunctiation

  def self.semesters_collection_for_select
    (1..2).inject([]) do |memo,current|
      memo << [human_attribute_name(:semester, count: current), current]
    end
  end

  def as_json options={}
    super include: :students
  end
end
