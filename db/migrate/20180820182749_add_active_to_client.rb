class AddActiveToClient < ActiveRecord::Migration[5.2]
  def change
   add_column :clients, :active , :boolean, default: true
  end
end
