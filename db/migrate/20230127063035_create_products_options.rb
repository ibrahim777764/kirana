class CreateProductsOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :products_options do |t|
      t.string :key
      t.string :value
      t.references :product, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
