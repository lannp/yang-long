class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|

      t.string :picture
      t.string :description
      t.integer :strong_point
      t.timestamps null: false
    end
  end
end
