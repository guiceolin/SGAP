class MessageSerializer < ActiveModel::Serializer
  attributes :body, :user
end
