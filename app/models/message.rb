class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  attr_accessible :body

  def self.newer_than(id)
    where("id > ?", "#{id}")
  end
end
