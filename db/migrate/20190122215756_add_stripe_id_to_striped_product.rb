class AddStripeIdToStripedProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :striped_products, :stripe_id, :string
    add_column :striped_plans, :stripe_id, :string
    add_column :striped_subscriptions, :stripe_id, :string
    add_column :striped_customers, :stripe_id, :string
  end
end
