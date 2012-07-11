class Professor < User

  has_many :crowds
  has_many :subjects, :through => :crowds

  def self.collection_for_selection
    all.inject([]) do |collection,professor|
      collection << [professor.name, professor.id]
    end
  end

end
