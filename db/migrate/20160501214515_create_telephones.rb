class CreateTelephones < ActiveRecord::Migration
  def change
    create_table :telephones do |t|
      t.string :name
      t.string :number

      t.timestamps null: false
    end
  end
end
