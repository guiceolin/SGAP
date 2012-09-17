class AddTopicToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :topic, :string
  end
end
