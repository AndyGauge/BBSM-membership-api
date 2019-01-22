class Striped::Product < ApplicationRecord
  def self.monthly_donation
    Striped::Product.first_or_create(name: "BBSM Monthly Donation", product_type: "service")
  end
  has_many :plans

  after_create :send_to_stripe

  def stripe_attributes
    {
      name: name,
      type: product_type
    }
  end

  def send_to_stripe
    unless response
      begin
        response = Stripe::Product.create( stripe_attributes )
      rescue Exception => e
        response = e.message
        update(response: response)
      else
        update(response: response, stripe_id: JSON.parse(response)["id"])
      end      
    end
  end
end
