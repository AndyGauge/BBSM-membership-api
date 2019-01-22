class API::V1::PaymentsController < ApplicationController
  def create
    p = Payment.new(JSON.parse(payment_params))
    if p.save && (Key.valid? p.key)
      render json: { status: 200, message: "Your card will be processed for $#{p.giving} beginning today, and on this day on subsequent months.  Thank you for your support!" }.to_json
    else
      render json: { status: 400, message: "Card not processed.  We will get in touch"}.to_json
    end
  end

  private

  def payment_params
    params[:payment]
  end
end
