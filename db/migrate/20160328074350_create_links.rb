class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :rel
      t.string :type
      t.integer :length
      t.string :href
      t.string :title

      t.timestamps
    end
  end
end
