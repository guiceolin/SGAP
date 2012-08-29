class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.belongs_to :user
      t.belongs_to :conversation
      t.boolean :archived,  default: false
      t.integer :last_read, default: 0

      t.timestamps
    end
  end
end
