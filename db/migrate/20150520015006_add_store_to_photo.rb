class AddStoreToPhoto < ActiveRecord::Migration
  def change
    add_reference :photos, :store, index: true
  end
end
