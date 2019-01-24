class Striped::Customer < ApplicationRecord
  belongs_to :payment
  has_many :subscriptions

  after_create :send_to_stripe

  def stripe_attributes
    {
      description: description,
      email: email,
      source: payment.token
    }
  end

  def send_to_stripe
    unless response
      begin
        response = Stripe::Customer.create( stripe_attributes )
      rescue Exception => e
        response = e.message
        update( response: response)
      else
        update(response: response, stripe_id: response["id"])
      end
    end
  end

  def send_to_civi
    names = payment.name.split(" ")
    cc = CiviContactCreator.new
    cc.json["first_name"] = names[0]
    cc.json["last_name"] = names[1..-1].join(" ")
    cc.make_request
    update(civi_id => cc.contact_id)
  end
end
