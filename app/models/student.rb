class Student < User
  has_many :enrollments
  has_many :crowds, through: :enrollments
  has_many :subjects, through: :crowds

  has_many :memberships
  has_many :groups, through: :memberships

  def self.search(terms)

    if terms.is_a? Hash
      query = scoped
      query = query.where("name LIKE ?", "%#{terms[:name]}%") if terms[:name].present?
      query = query.where("username LIKE ?", "%#{terms[:username]}%") if terms[:username].present?
      query = query.where("email LIKE ?", "%#{terms[:email]}%") if terms[:email].present?
      query
    elsif terms.present?
      where("name LIKE :terms OR username LIKE :terms OR email LIKE :terms", terms: "%#{terms}%")
    else
      all
    end
  end

#  def as_json(options={})
#    super.merge({ label: name, value: to_param })
#  end

 end
