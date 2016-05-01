class CreateFileAttackts < ActiveRecord::Migration
  def change
    create_table :file_attackts do |t|
      t.string :name
      t.string :src

      t.timestamps null: false
    end
  end
end
