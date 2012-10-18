class Group < ActiveRecord::Base

  attr_accessible :name

  has_one :crowd, :through => :enunciation
  has_one :solution
  belongs_to :enunciation

  has_many :memberships
  has_many :students, through: :memberships
  has_many :conversations, as: :scope

  validates_presence_of :name

  before_save :fix_participations
  after_create :create_solution

  def fix_participations
    conversations.map(&:save)
  end

  def self.active
    joins(:enunciation).where('enunciations.end_date >= ?', Date.today.beginning_of_day)
  end
  def to_param
    name
  end

  def participations
    students
  end

  def create_solution
    self.solution = Solution.new
  end
end
