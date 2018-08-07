class CreateCoinChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :coin_checks do |t|
      t.string :md5

      t.timestamps
    end
    add_index :coin_checks, :md5, unique: true
  end
end
