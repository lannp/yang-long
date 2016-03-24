class Api::V1::CategoriesController < ApplicationController
  respond_to :json

  def index
    categories = Category.all.order(:strong_point)
    # total_record = categories.count
    # page = total_record/Settings.perpage
    # total_page = (page == 0 && (total_record % Settings.perpage) ==0) ? page : page+1

    render json: categories, each_serializer: CategorySerializer, get_index: true
  end

  def show
    category = Category.find_by(link: params[:id])
    render json: category
  end
end
