class AddSemesterAndYearToCrowd < ActiveRecord::Migration
  def change
    add_column :crowds, :semester, :integer
    add_column :crowds, :year, :integer
  end
end
