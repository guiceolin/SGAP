class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :conversation
      t.text :body

      t.timestamps
    end
  end

  def down
  end
end
