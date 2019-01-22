class AddPaymentToStripedCustomer < ActiveRecord::Migration[6.0]
  def change
    add_reference :striped_customers, :payment, foreign_key: true
  end
end
