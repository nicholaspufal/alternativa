class AddDurationAndStartDateToExams < ActiveRecord::Migration
  def change
    add_column :exams, :duration, :float
    add_column :exams, :start_date, :date
  end
end
