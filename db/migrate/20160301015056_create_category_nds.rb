class CreateCategoryNds < ActiveRecord::Migration
  def change
    create_table :category_nds do |t|

      t.string :name
      t.integer :category_id
      t.string :link
      t.timestamps null: false
    end
  end
end
