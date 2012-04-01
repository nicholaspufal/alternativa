class AddWeightToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :weight, :decimal
  end
end
