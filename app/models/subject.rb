class Subject < ActiveRecord::Base
  attr_accessible :code, :description, :name

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true
  validates :description, presence: true

  def to_s
    "#{name} (#{code})"
  end

end
