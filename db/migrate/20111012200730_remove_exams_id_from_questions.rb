class RemoveExamsIdFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :exams_id
  end

  def down
    add_column :questions, :exams_id, :integer
  end
end
