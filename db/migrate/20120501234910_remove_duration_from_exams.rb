class RemoveDurationFromExams < ActiveRecord::Migration
  def up
    remove_column :exams, :duration
  end

  def down
    add_column :exams, :duration, :integer
  end
end
