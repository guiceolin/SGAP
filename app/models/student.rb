class Student < User
  has_many :enrollments
  has_many :crowds, through: :enrollments

  def self.search(terms)

    if terms.is_a? Hash
      query = scoped
      query = query.where("name LIKE ?", "%#{terms[:name]}%") if terms[:name].present?
      query = query.where("username LIKE ?", "%#{terms[:username]}%") if terms[:username].present?
      query = query.where("email LIKE ?", "%#{terms[:email]}%") if terms[:email].present?
      query
    elsif terms.present?
      where("name LIKE ?", "%#{terms}%").where("username LIKE ?", "%#{terms}%").where("email LIKE ?", "%#{terms}%")

    else
      all
    end
  end

  def as_json(options={})
    super.merge({ label: name, value: name })
  end

 end
