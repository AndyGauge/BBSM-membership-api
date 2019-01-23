class CreateStripedWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_table :striped_webhooks do |t|
      t.string :event
      t.references :striped_subscription, foreign_key: true

      t.timestamps
    end
  end
end
