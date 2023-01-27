class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :product_id
      t.datetime :order_time
      t.timestamps
    end
  end
end