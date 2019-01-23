class Striped::Charge < ApplicationRecord
  belongs_to :customer, class_name: "Striped::Customer", foreign_key: 'striped_customer_id'
end
