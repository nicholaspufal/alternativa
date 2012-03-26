class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.decimal :grade
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
