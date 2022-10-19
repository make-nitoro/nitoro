class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :address
      t.string :postal_code
      t.string :name
      t.string :amount
      t.integer :status
      t.integer :payment_way
      t.integer :postage
      t.integer :all_price

      t.timestamps
    end
  end
end
