class CreateGoogleTasks < ActiveRecord::Migration
  def change
    create_table :google_tasks do |t|
      t.column :task_id, :integer
      t.column :user_id, :integer
      t.column :google_id, :string
    end
  end
end
