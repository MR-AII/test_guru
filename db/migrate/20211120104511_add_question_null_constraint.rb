class AddQuestionNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:questions, :title, false)
    change_column_null(:questions, :test_id, false)
  end
end
