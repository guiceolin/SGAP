class Group < ActiveRecord::Base

  attr_accessible :name

  belongs_to :crowd

  has_many :memberships
  has_many :students, through: :memberships
  has_many :conversations, as: :scope

  validates_presence_of :name

  before_save :fix_participations

  def fix_participations
    conversations.map(&:save)
  end


  def to_param
    name
  end

  def participations
    students
  end
 end
