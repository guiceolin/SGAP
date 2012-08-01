class Subject < ActiveRecord::Base
  attr_accessible :code, :description, :name

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :description, presence: true

  def to_s
    "#{name} (#{code})"
  end

  def self.search(terms)
    if terms.is_a? Hash
      query = scoped
      query = query.where("name LIKE ?",        "%#{terms[:name]}%")        if terms[:name].present?
      query = query.where("code LIKE ?",        "%#{terms[:code]}%")        if terms[:code].present?
      query = query.where("description LIKE ?", "%#{terms[:description]}%") if terms[:description].present?
      query
    elsif terms.present?
      where('name LIKE :terms OR code LIKE :terms', terms: "%#{terms}%")
    else
      all
    end
  end
  def self.collection_for_selection
    all.inject([]) do |collection,subject|
      collection << [subject.name, subject.id]
    end
  end

  def as_json options={}
    super.merge({ label: name, value: id })
  end


end
