class Conversation < ActiveRecord::Base
  has_many :participations
  has_many :users, through: :participations
  has_many :messages

  def as_json(options={})
    super(options.reverse_merge(:include => :users)).merge(:message => messages.first.as_json)
  end
end
