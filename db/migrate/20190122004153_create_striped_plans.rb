class CreateStripedPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :striped_plans do |t|
      t.integer :amount
      t.references :striped_product, foreign_key: true
      t.string :response

      t.timestamps
    end
  end
end
