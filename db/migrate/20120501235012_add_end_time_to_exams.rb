class AddEndTimeToExams < ActiveRecord::Migration
  def change
    add_column :exams, :end_time, :datetime
  end
end
