class ModifyDurationFromExams < ActiveRecord::Migration
  def up
    change_column :exams, :duration, :integer
  end

  def down
    change_column :exams, :duration, :float
  end
end
