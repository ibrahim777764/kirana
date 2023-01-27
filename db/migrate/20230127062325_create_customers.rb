class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email, null: false
      t.index :email, unique: true
      t.string :number
      t.text :address
      t.string :password_digest
      t.timestamps
    end
  end
end
  