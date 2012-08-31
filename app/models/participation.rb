class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  def archived?
    !!archived
  end

  def archive!
    archived = true
  end

  def read!
    ret = last_read
    update_attribute(:last_read, conversation.messages.last.id)
    return ret
  end
end
