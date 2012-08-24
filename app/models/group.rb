class Group < ActiveRecord::Base

  attr_accessible :name

  belongs_to :crowd

  has_many :memberships
  has_many :students, through: :memberships

  validates_presence_of :name

  def to_param
    name
  end
end
