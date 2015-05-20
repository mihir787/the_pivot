class AddPhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.integer :price

      t.timestamps null: false
    end
  end
end
