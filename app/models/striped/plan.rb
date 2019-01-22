class Striped::Plan < ApplicationRecord
  belongs_to :payment
  belongs_to :product, class_name: "Striped::Product", foreign_key: 'striped_product_id'
  has_many :subscriptions

  after_create :send_to_stripe

  def stripe_attributes
    {
      amount: amount,
      interval: "month",
      product: product.stripe_id,
      currency: "usd"
    }
  end

  def send_to_stripe
    unless response
      begin
        response = Stripe::Plan.create( stripe_attributes )
      rescue Exception => e
        response = e.message
        update(response: response)
      else
        update(response: response, stripe_id: JSON.parse(response)["id"])
      end

    end
  end
end
