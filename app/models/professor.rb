class Professor < User

  has_many :crowds
  has_many :subjects, :through => :crowds

  def self.collection_for_selection
    all.inject([]) do |collection,professor|
      collection << [professor.name, professor.id]
    end
  end

  def self.search(terms)
    if terms.is_a? Hash
      query = scoped
      query = query.where('name like ?', "%#{terms[:name]}%") if terms[:name].present?
      query = query.where('username like ?', "%#{terms[:username]}%") if terms[:username].present?
      query = query.where('email like ?', "%#{terms[:email]}%") if terms[:email].present?
      query
    elsif terms.present?
      where("name LIKE :terms OR username LIKE :terms OR email LIKE :terms", terms: "%#{terms}%")
    else
      all
    end
  end

  def as_json(options={})
    super.merge({ label: name, value: username })
  end


end
