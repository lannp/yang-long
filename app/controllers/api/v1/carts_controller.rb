class Api::V1::CartsController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index, :update, :destroy, :create]

  def index
    carts = Cart.where(user: @current_user).not_is_bought
    # total_record = categories.count
    # page = total_record/Settings.perpage
    # total_page = (page == 0 && (total_record % Settings.perpage) ==0) ? page : page+1
    total_cart = carts.count
    total = 0
    price = 0
    carts.each do |cart|
      total += cart.number
      price += cart.product.sale? ? (cart.number* cart.product.sale) : (cart.number * cart.product.price)
    end
    carts = carts.page(params[:page]).per_page(2)
    carts = ActiveModel::ArraySerializer.new(carts, each_serializer: CartSerializer)
    render json: {carts: carts, page: params[:page], total: total, price: price, total_cart: total_cart}
  end

  def show
    category = Category.find_by(link: params[:id])
    render json: category
  end

  def update
    cart = Cart.find(params[:id])
    if cart.update(cart_params)
      render json: cart, serializer: CartSerializer, get_total_price: true, status: 201 #, location: [:api, cart]
    else
      render json: { errors: cart.errors }, status: 422
    end
  end

  def create
    cart = Cart.new(cart_params)
    if cart.save
      render json: cart, serializer: CartSerializer, get_total_price: true, status: 201 #, location: [:api, cart]
    else
      render json: { errors: cart.errors }, status: 422
    end
  end

  private
  def cart_params
    params.require(:cart).permit(:id, :product_id, :number, :user_id)
  end
end
