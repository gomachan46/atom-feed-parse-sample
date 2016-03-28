class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :guid
      t.string :summary
      t.text :content
      t.references :feed, index: true

      t.timestamps
    end
  end
end
