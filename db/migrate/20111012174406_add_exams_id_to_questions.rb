class AddExamsIdToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :exam_id, :integer
  end
  
  def down
    remove_column :questions, :exam_id
  end
end
