class AddTestDefaultValueLevel < ActiveRecord::Migration[6.1]
  def up_only
    change_column_default(:tests, :level, 1)
  end
end
