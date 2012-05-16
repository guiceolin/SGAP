class CreateCrowds < ActiveRecord::Migration
  def change
    create_table :crowds do |t|
      t.string :name
      t.references :professor
      t.references :subject

      t.timestamps
    end
    add_index :crowds, :professor_id
    add_index :crowds, :subject_id
  end
end
