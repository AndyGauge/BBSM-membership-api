# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
 allow do
   origins 'https://www.beboldstreetministries.org'

     resource '*',
       headers: :any,
       methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
end


#Payment.create({name:"Andrew A Gauger",email:"andrewgauger@hotmail.com",giving:"100",street:"1455 Marshall Dr SE",city:"Salem",province:"OR",zip:"97302",token:"tok_1DvD6qEyRpgj5qe89gC8fLyq",key:"21c8f6e28d05b8b5"})
