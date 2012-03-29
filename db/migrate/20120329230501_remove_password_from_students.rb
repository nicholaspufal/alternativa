class RemovePasswordFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :password
  end

  def down
    add_column :students, :password, :string
  end
end
