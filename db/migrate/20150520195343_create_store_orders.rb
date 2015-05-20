class CreateStoreOrders < ActiveRecord::Migration
  def change
    create_table :store_orders do |t|
      t.references :store, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
    end
  end
end
