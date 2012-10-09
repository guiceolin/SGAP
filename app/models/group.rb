class Group < ActiveRecord::Base

  attr_accessible :name

  has_one :crowd, :through => :enunciation
  belongs_to :enunciation

  has_many :memberships
  has_many :students, through: :memberships
  has_many :conversations, as: :scope

  validates_presence_of :name

  before_save :fix_participations

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
end
