class Professor < User

  has_many :crowds
  has_many :subjects, :through => :crowds

  def self.collection_for_selection
    all.inject([]) do |collection,professor|
      collection << [professor.name, professor.id]
    end
  end

  def self.search(terms)
    if terms.present?
      query = scoped
      query = query.where('name like ?', "%#{terms[:name]}%") if terms[:name].present?
      query = query.where('username like ?', "%#{terms[:username]}%") if terms[:username].present?
      query = query.where('email like ?', "%#{terms[:email]}%") if terms[:email].present?
      query
    else
      all
    end

  end

end
