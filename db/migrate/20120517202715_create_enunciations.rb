class CreateEnunciations < ActiveRecord::Migration
  def change
    create_table :enunciations do |t|
      t.string :name
      t.text :description
      t.date :end_date
      t.references :professor

      t.timestamps
    end
  end
end
