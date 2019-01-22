class CreateStripedProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :striped_products do |t|
      t.string :name
      t.string :product_type
      t.string :response

      t.timestamps
    end
  end
end
