class AddColumnToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :body, :string, null: false
  end
end
