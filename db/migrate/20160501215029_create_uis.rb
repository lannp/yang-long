class CreateUis < ActiveRecord::Migration
  def change
    create_table :uis do |t|
      t.string :name
      t.references :file_attackt, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
