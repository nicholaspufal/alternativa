class RemoveTeachers < ActiveRecord::Migration
  def up
    drop_table :teachers
  end
  
  def down
    create_table :teachers
  end
end

