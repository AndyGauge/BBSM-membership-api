class Striped::Webhook < ApplicationRecord
  belongs_to :customer, class_name: "Striped::Customer", foreign_key: 'striped_customer_id', optional:true

  before_create :find_customer

  def parsed_event
    @event ||= JSON.parse(event)
  end

  def find_customer
    return false unless cust = parsed_event.dig("object", "customer")
    customer = Striped::Customer.find_by_stripe_id cust
  end
end
