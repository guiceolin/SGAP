class AddScopeToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :scope_id, :integer
    add_column :conversations, :scope_type, :string
  end
end
