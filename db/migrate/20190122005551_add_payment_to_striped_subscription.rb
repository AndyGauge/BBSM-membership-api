class AddPaymentToStripedSubscription < ActiveRecord::Migration[6.0]
  def change
    add_reference :striped_subscriptions, :payment, foreign_key: true
  end
end
