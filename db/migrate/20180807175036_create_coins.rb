class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :root_uuid, null: false
      t.string :uuid, null: false
      t.string :md5, null: false
      t.boolean :spent, dafault: false

      t.timestamps
    end
    add_index :coins, :uuid, unique: true
    add_index :coins, :md5, unique: true 
  end
end
