class UserSerializer < ActiveModel::Serializer
  attributes :id

  def attributes
    hash = super
    hash["label"] = object.name
    hash["value"] = object.to_param
    hash
  end
end
