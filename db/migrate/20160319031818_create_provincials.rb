class CreateProvincials < ActiveRecord::Migration
  def change
    create_table :provincials do |t|

      t.string :name
      t.timestamps null: false
    end
  end
end
