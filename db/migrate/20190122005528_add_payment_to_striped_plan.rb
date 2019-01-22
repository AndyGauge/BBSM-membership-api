class AddPaymentToStripedPlan < ActiveRecord::Migration[6.0]
  def change
    add_reference :striped_plans, :payment, foreign_key: true
  end
end
