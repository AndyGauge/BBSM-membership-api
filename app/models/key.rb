###
# The membership page requests a key, and as long as that key is < 24 hours
# Old the API will create the membership.  Create a 1 hour Timer on the
# page to request a new key just in case
#
# key.code should be more secure in production
###

class Key < ApplicationRecord
  before_create do |key|
    key.code = SecureRandom.hex(8)
  end

  def self.valid? (code)
    k = Key.find_by_code code
    k && Time.now - k.created_at < (60*60*24)
  end
end
