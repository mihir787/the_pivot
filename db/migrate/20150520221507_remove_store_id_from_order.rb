class RemoveStoreIdFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :store_id 
  end
end
