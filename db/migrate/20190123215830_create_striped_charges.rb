class CreateStripedCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :striped_charges do |t|
      t.references :striped_customer, foreign_key: true
      t.string :amount
      t.string :receipt_url
      t.string :last4

      t.timestamps
    end
  end
end
