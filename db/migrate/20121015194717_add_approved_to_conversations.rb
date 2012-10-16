class AddApprovedToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :approved, :boolean, default: false
  end
end
