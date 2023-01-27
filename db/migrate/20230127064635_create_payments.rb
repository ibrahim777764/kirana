class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.integer :customer_id
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
