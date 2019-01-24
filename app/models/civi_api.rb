class CiviAPI < ApplicationRecord
  def reset_options
    @options = {
      "version" => "3",
      "api_key" => ENV['CIVI_API_KEY'],
      "key"     => ENV['CIVI_KEY']
    }
  end
  attr_accessor :entity, :json, :action

  def make_request
    reset_options
    @options[:entity] = entity
    @options[:json] = json.to_json
    @options[:action] = action
    self.request = @options

    uri= URI(ENV['CIVI_SERVER'])
    self.response = Net::HTTP::post_form(uri, @options).body
    save

  end
end
