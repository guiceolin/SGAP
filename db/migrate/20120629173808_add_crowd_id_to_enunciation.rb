class AddCrowdIdToEnunciation < ActiveRecord::Migration
  def change
    remove_column :enunciations, :professor_id
    add_column    :enunciations, :crowd_id, :integer
  end
end
