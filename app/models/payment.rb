class Payment < ApplicationRecord
  has_one :customer, class_name: "Striped::Customer"
  has_one :plan, class_name: "Striped::Plan"
  has_one :subscription, class_name: "Striped::Subscription"
  after_create :stripe_generator

  #private
  def stripe_generator
    create_customer(email: self.email, description: self.name)
    create_plan(product: Striped::Product.monthly_donation, amount: self.giving.to_i * 100)
    create_subscription(plan: plan, customer: customer)
  end
end
