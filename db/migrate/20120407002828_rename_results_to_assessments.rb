class RenameResultsToAssessments < ActiveRecord::Migration
  def up
    rename_table :results, :assessments
  end

  def down
    rename_table :assessments, :results
  end
end
