class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :reservation_id

      t.timestamps null: false
    end
    add_index :purchases, [:user_id, :reservation_id], unique: true
  end
end
