class Striped::Charge < ApplicationRecord
  belongs_to :customer, class_name: "Striped::Customer", foreign_key: 'striped_customer_id'

  before_create :send_to_civi

  def send_to_civi
    c = CiviContributionCreator.new
    c.json["total_amount"] = "#{amount.to_i/100}.00"
    c.json["contact_id"] = customer.civi_id
    c.make_request
  end
end
