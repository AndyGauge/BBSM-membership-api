class API::V1::EventsController < ApplicationController
  def create
    Striped::Webhook.create(event: Stripe::Event.retrieve(params[:id]))
    render nothing: true, status: 200
  rescue Stripe::APIConnectionError, Stripe::StripeError
      render nothing: true, status: 400
  end
end
