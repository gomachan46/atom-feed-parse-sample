class ChangeContentToEntries < ActiveRecord::Migration
  def change
    change_column :entries, :content, :text, limit: 16.megabytes - 1
  end
end
