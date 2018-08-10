class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :amount_edin
      t.float :price_euro
      t.float :total_euro
      t.string :oid
      t.boolean :closed, default: false
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
