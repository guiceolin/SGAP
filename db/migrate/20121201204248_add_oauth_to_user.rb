class AddOauthToUser < ActiveRecord::Migration
  def change
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_id, :string
  end
end
