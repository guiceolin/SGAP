class Student < User
  has_many :enrollments
  has_many :crowds, through: :enrollments

  def self.search(term)
    if term
      where("name LIKE ?", "%#{term}%").where("username LIKE ?", "%#{term}%").where("email LIKE ?", "%#{term}%")
    else
      all
    end
  end

  def as_json(options={})
    super
  end

 end
