class CreateStripedCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :striped_customers do |t|
      t.string :email
      t.string :description
      t.string :response

      t.timestamps
    end
  end
end
