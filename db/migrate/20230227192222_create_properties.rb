class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.references :account
      t.string :description
      t.string :address
      t.string :email
      t.integer :price
      t.integer :rooms
      t.integer :phone
      t.string :bathrooms
      t.string :image

      t.timestamps
    end
  end
end
