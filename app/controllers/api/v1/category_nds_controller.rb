class Api::V1::CategoryNdsController < ApplicationController
  respond_to :json

  def index
    categories = CategoryNd.all
    # .page(params[:page]).per_page(Settings.perpage)
    # total_record = categories.count
    # page = total_record/Settings.perpage
    # total_page = (page == 0 && (total_record % Settings.perpage) ==0) ? page : page+1

    render json: categories
  end

  def show
    category = CategoryNd.find_by(link: params[:id])
    render json: category
  end
end
