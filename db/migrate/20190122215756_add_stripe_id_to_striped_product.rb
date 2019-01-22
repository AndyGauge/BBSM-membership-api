class AddStripeIdToStripedProduct < ActiveRecord::Migration[6.0]
  def change
    add_string :striped_product, :stripe_id
    add_string :striped_plan, :stripe_id
    add_string :striped_subscription, :stripe_id
    add_string :striped_customer, :stripe_id
  end
end
