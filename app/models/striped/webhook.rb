class Striped::Webhook < ApplicationRecord
  serialize :event, JSON
  belongs_to :customer, class_name: "Striped::Customer", foreign_key: 'striped_customer_id', optional:true

  before_create :find_customer

  def find_customer
    return false unless cust = event.dig("object", "customer")
    self.customer = Striped::Customer.find_by_stripe_id cust

    if event.dig("object", "object") == "charge"
      Striped::Charge.create(
        customer:    self.customer,
        amount:      event.dig("object", "amount"),
        receipt_url: event.dig("object", "receipt_url"),
        last4:       event.dig("object", "source", "last4")
      )
    end
  end
end
