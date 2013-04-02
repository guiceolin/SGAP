class Student < User
  has_many :enrollments
  has_many :crowds, through: :enrollments
  has_many :subjects, through: :crowds

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :solutions, through: :groups

  def self.search(param)
    terms = param[:term]
    crowd_id = param[:crowd_id]
    enunciation_id = param[:enunciation_id]

    if terms.is_a? Hash
      query = scoped
      query = query.where("name LIKE ?", "%#{terms[:name]}%") if terms[:name].present?
      query = query.where("username LIKE ?", "%#{terms[:username]}%") if terms[:username].present?
      query = query.where("email LIKE ?", "%#{terms[:email]}%") if terms[:email].present?
      query
    elsif terms.present?
      Crowd.where(name: crowd_id).first.students.where("users.name LIKE :terms OR users.username LIKE :terms OR users.email LIKE :terms", terms: "%#{terms}%").to_a - Enunciation.find(enunciation_id).groups.map(&:students).flatten.uniq
    else
      all
    end
  end

#  def as_json(options={})
#    super.merge({ label: name, value: to_param })
#  end

 end
