class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

      t.integer :ms
      t.string :name
      t.string :street
      t.integer   :provincial_id
      t.integer   :district_id
      t.string :phone
      t.integer :product_id
      t.integer :number
      t.string :size
      t.timestamps null: false
    end
  end
end
