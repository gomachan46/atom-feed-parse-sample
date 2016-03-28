class CreateEntryLinks < ActiveRecord::Migration
  def change
    create_table :entry_links do |t|
      t.references :entry, index: true
      t.references :link, index: true

      t.timestamps
    end
  end
end
