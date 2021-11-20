class AddForeignKeyToCategoiesId < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :tests, :categories
  end
end
