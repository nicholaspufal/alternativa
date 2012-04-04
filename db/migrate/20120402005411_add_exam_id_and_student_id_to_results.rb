class AddExamIdAndStudentIdToResults < ActiveRecord::Migration
  def change
    add_column :results, :exam_id, :integer
    add_column :results, :student_id, :integer
  end
end
