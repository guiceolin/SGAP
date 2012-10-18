class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :group
      t.timestamps
    end
  end
end
