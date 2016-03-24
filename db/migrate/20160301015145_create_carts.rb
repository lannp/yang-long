class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|

      t.integer :user_id
      t.string :product_id
      t.integer :number, default: 1
      t.boolean :is_bought, default: false
      t.timestamps null: false
    end
  end
end
