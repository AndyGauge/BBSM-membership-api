class API::V1::KeysController < ApplicationController
  def create
    render :json => Key.create
  end
end
