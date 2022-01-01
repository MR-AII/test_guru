class DropTablePassedTests < ActiveRecord::Migration[6.1]
  def change
    drop_table :passed_tests
  end
end
