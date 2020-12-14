class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code  , default: "", null: false
      t.string :prefecture_id,              null: false
      t.string :municipality , default: "", null: false
      t.string :house_number , default: "", null: false
      t.string :building_name, default: ""
      t.string :phone_number , default: "", null: false
      t.references :order                   , foreign_key: true
    end
  end
end
