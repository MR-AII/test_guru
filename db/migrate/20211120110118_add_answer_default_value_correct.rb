class AddAnswerDefaultValueCorrect < ActiveRecord::Migration[6.1]
  def up
    change_column_default(:answers, :correct, false )
  end
end
