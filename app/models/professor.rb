class Professor < User

  has_many :crowds
  has_many :subjects, :through => :crowds
  has_many :enunciations

end
