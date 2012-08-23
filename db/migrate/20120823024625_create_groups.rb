class CreateGroups < ActiveRecord::Migration

  def change
    create_table :groups do |t|
      t.references :crowd
      t.string :name

      t.timestamps
    end
    add_index :groups, :crowd_id
  end
end
