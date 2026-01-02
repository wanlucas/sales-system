class CreateSellers < ActiveRecord::Migration[8.0]
  def change
    create_table :sellers, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :business_name
      t.string :document
      t.boolean :is_active, default: true, null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :sellers, :email, unique: true
    add_index :sellers, :document, unique: true
    add_index :sellers, :deleted_at
  end
end
