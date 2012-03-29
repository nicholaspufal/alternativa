class CreateGroupsStudents < ActiveRecord::Migration
  def up
    create_table :groups_students do |t|
      t.references  :group
      t.references  :student
    end
  end

  def down
    drop_table :groups_students
  end
end
