class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products, id: :uuid do |t|
      t.uuid :seller_id, null: false
      t.string :title, null: false
      t.text :description
      t.decimal :price, precision: 10, scale: 2, null: false
      t.boolean :is_active, default: true, null: false
      t.datetime :deleted_at

      t.timestamps
      
      t.index :seller_id
      t.index :deleted_at
      t.index [:seller_id, :is_active]
    end

    add_foreign_key :products, :sellers, column: :seller_id
  end
end
