class UserSerializer < ActiveModel::Serializer
  attributes :id, :value

  def value
    object.to_param
  end

  def label
    object.name
  end
end
