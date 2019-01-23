class RenameStripedWebhookCustomerId < ActiveRecord::Migration[6.0]
  def change
    rename_column :striped_webhooks, :striped_subscription_id, :striped_customer_id
  end
end
