class Striped::Webhook < ApplicationRecord
  belongs_to :subscription, class_name: "Striped::Subscription", foreign_key: 'striped_subscription_id', optional:true
end
