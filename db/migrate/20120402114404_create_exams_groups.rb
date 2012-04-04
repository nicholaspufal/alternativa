class CreateExamsGroups < ActiveRecord::Migration
  def change
    create_table :exams_groups do |t|
      t.integer :exam_id
      t.integer :group_id
    end
  end
end
