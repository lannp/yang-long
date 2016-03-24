class Api::V1::ResultsController < ApplicationController
  respond_to :json

  def index
    if(params[:category_nd]=="all")
      products = Product.all.page(params[:page]).per_page(Settings.perpage)
    else
      products =  CategoryNd.find_by(link: params[:category_nd]).
        products.page(params[:page]).per_page(Settings.perpage)
    end
    total_record = products.count

    render json: {products: products, total_record: total_record}
  end

  # def show
  #   category = Category.find_by(link: params[:id])
  #   render json: category
  # end
end
