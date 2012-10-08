class AddEnunciationIdToGroup < ActiveRecord::Migration
  def change
    remove_column :groups, :crowd_id
    add_column :groups, :enunciation_id, :integer
  end
end
