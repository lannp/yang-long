class Api::V1::ProvincialsController < ApplicationController
  respond_to :json

  def index
    provincials = Provincial.all
    render json: provincials
  end
end
