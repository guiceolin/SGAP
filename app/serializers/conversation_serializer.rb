class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :scope_id, :scope_type, :topic
  has_many :participations, key: :participation
  has_many :messages
  has_many :users

  def scope_obj
    { name: object.scope.name, type: object.scope.class.model_name.human }
  end

  def participations
    conversation.participations.where(user_id: scope)
  end

  #def messages
  #  conversation.messages.newer_than(@options[:last_read].present? ? @options[:last_read] : 0)
  #end

end
