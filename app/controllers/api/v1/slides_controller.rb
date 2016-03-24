class Api::V1::SlidesController < ApplicationController
  respond_to :json

  def index
    slides = Slide.all.order(:strong_point)
    render json: slides
  end
end
