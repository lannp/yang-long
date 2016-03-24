class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.string :ms
      t.string :name
      t.string :description
      t.string :size
      t.string :material
      t.string :picture
      t.integer :price
      t.integer :sale
      t.integer :number
      t.integer :category_nd_id

      t.timestamps null: false
    end
  end
end
