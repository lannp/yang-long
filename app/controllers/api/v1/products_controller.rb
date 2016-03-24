class Api::V1::ProductsController < ApplicationController
  respond_to :json

  def index
    # byebug
    if(params[:category_id])
      products = Category.find_by(link: params[:category_id]).products
    elsif ((params[:category_nd_id]) && params[:category_nd_id] != 'all')
      products = CategoryNd.find_by(link: params[:category_nd_id]).products
    else
      products = Product.all
    end
    if(params[:price])
      case(params[:price])
      when '2'
        products = products.price_in_0_100
      when '3'
        products = products.price_in_100_200
      when '4'
        products = products.price_in_200_300
      when '5'
        products = products.price_over_300
      end
    end
    products = products.page(params[:page]).per_page(Settings.perpage)
    total_record = products.count

    # page = total_record/Settings.perpage
    # total_page = (page == 0 && (total_record % Settings.perpage) ==0) ? page : page+1
    products = ActiveModel::ArraySerializer.new(products, each_serializer: ProductSerializer, scope: current_user)
    render json: {products: products, total_record: total_record, page: params[:page], price: params[:price].to_i}
  end

  def show
    product = Product.find_by(ms: params[:id])
    render json: product
  end
end
