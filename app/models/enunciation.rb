class Enunciation < ActiveRecord::Base
  belongs_to :crowd
  attr_accessible :description, :end_date, :name

  def to_param
    name
  end
end
