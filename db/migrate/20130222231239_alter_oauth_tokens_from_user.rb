class AlterOauthTokensFromUser < ActiveRecord::Migration
  def down
    add_column :users, :oauth_id, :string
    add_column :users, :oauth_token, :string
    remove_column :users, :oauth_refresh_token
    remove_column :users, :oauth_access_token
    remove_column :users, :oauth_expires_at
  end
  def up
    remove_column :users, :oauth_id
    remove_column :users, :oauth_token
    add_column :users, :oauth_refresh_token, :string
    add_column :users, :oauth_access_token, :string
    add_column :users, :oauth_expires_at, :integer
  end
end
