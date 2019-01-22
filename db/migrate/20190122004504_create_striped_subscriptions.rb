class CreateStripedSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :striped_subscriptions do |t|
      t.references :striped_customer, foreign_key: true
      t.references :striped_plan, foreign_key: true
      t.string :response

      t.timestamps
    end
  end
end
