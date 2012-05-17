class Enunciation < ActiveRecord::Base
  belongs_to :professor
  attr_accessible :description, :end_date, :name
end
