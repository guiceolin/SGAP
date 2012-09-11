class Group < ActiveRecord::Base

  attr_accessible :name

  belongs_to :crowd

  has_many :memberships
  has_many :students, through: :memberships
  has_many :conversations, as: :scope

  validates_presence_of :name

  def to_param
    name
  end
end
