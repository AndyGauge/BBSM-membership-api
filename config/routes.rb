Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {format: :json}, :path=> "" do
    namespace :v1 do
      resource :key, only: [:create]
      resource :payment, only: [:create]
      resource :event, only: [:create]
    end
  end
end
