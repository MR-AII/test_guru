class AddGistIdToGists < ActiveRecord::Migration[6.1]
  def change
    add_column :gists, :gist_id, :string
  end
end
