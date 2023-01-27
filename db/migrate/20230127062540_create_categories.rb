class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      add_column :products, :product_color, :string
      add_column :products, :product_size, :string
      add_reference :products, :parent, foreign_key: {to_table: :products}
    end
  end
end