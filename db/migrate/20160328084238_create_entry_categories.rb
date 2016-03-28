class CreateEntryCategories < ActiveRecord::Migration
  def change
    create_table :entry_categories do |t|
      t.references :entry, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
