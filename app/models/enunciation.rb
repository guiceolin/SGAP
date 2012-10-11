class Enunciation < ActiveRecord::Base
  belongs_to :crowd
  has_many :groups
  attr_accessible :description, :end_date, :name
  has_many :attachments, as: :attachable

  after_create :clone_groups, :if => Proc.new { |e| e.groups.empty? }

  def to_param
    name
  end

  def last_enunciation
    Enunciation.where(:crowd_id => crowd.id).where('id != ?', id).order('end_date DESC').limit(1).first
  end

  def clone_groups(base_enunciation = last_enunciation)
    return true unless base_enunciation
    base_enunciation.groups.each do |group|
      new_group = group.dup
      group.students.map { |s| new_group.students << s }
      self.groups << new_group
    end
  end

  def clone_attachments(base_enunciation)
    base_enunciation.attachments.each do |attachment|
      new_attachment = Attachment.new
      new_attachment.file = File.open(attachment.file.current_path)
      self.attachments << new_attachment
    end
  end
end
