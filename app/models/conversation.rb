class Conversation < ActiveRecord::Base
  has_many :participations
  has_many :users, through: :participations
  has_many :messages
  belongs_to :scope, polymorphic: true

  before_save :fix_participations

  def as_json(options={})
    super(options.reverse_merge(:include => :users)).merge(:message => messages.first.as_json)
  end

  def fix_participations
    excluded = users - scope.participations
    included = scope.participations - users

    self.users = self.users - excluded + included
  end
end
