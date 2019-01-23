class Striped::Subscription < ApplicationRecord
  belongs_to :customer, class_name: "Striped::Customer", foreign_key: 'striped_customer_id'
  belongs_to :plan, class_name: "Striped::Plan", foreign_key: 'striped_plan_id'
  belongs_to :payment

  after_create :send_to_stripe

  def stripe_attributes
    {
      customer: customer.stripe_id,
      items:
      [
        plan: plan.stripe_id
      ]
    }
  end

  def send_to_stripe
    unless response
      begin
        response = Stripe::Subscription.create( stripe_attributes )
      rescue Exception => e
        response = e.message
        update(response: response)
      else
        update(response: response, stripe_id: response["id"])
      end
    end
  end
end
