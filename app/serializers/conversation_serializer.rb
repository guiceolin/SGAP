class ConversationSerializer < ActiveModel::Serializer
  attributes :id
  has_many :participations, key: :participation
  has_many :messages
  has_many :users

  def participations
    conversation.participations.where(user_id: scope)
  end

  def messages
    conversation.messages.newer_than(@options[:last_read])
  end

end
