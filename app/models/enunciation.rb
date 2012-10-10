class Enunciation < ActiveRecord::Base
  belongs_to :crowd
  has_many :groups
  attr_accessible :description, :end_date, :name
  has_many :attachments, as: :attachable

  before_create :clone_groups

  def to_param
    name
  end

  def last_enunciation
    Enunciation.where(:crowd_id => crowd.id).order('end_date DESC').limit(1).first
  end

  def clone_groups
    binding.pry
    last_enunciation.groups.each do |group|
      new_group = group.dup
      group.students.map { |s| new_group.students << s }
      self.groups << new_group
    end
  end
end
