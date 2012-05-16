class Professor < User

  has_many :crowds
  has_many :subjects, :through => :crowds

end
