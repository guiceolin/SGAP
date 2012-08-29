class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  def archived?
    !!archived
  end

  def archive!
    archived = true
  end
end
