class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :email, null: false
      t.string :domain, null: false
      t.string :ipv4
      t.string :ipv6
      t.string :uuid, null: false
      t.string :secret_key

      t.timestamps
    end
    add_index :clients, :uuid, unique: true
  end
end
