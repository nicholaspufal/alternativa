class AddStartTimeToExams < ActiveRecord::Migration
  def change
    add_column :exams, :start_time, :datetime

  end
end
