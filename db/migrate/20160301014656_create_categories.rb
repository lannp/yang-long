class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string :name
      t.integer :strong_point
      t.string :link

      t.timestamps null: false
    end
  end
end
