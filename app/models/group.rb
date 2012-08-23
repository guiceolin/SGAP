class Group < ActiveRecord::Base

  attr_accessible :name

  belongs_to :crowd
  validates_presence_of :name

  def to_param
    name
  end
end
