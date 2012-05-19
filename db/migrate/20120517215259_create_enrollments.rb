class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :student
      t.references :crowd

      t.timestamps
    end
    add_index :enrollments, :student_id
    add_index :enrollments, :crowd_id
  end
end
