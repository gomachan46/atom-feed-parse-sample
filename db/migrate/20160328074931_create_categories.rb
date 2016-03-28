class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :term
      t.string :label

      t.timestamps
    end
  end
end
