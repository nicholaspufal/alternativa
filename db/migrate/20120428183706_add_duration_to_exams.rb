class AddDurationToExams < ActiveRecord::Migration
  def change
    add_column :exams, :duration, :float

  end
end
