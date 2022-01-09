class RenameColumntUserIdToAuthorId < ActiveRecord::Migration[6.1]
  def change
    rename_column :tests, :user_id, 'author_id'
  end
end
