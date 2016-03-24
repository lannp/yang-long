class Api::V1::OrdersController < ApplicationController
  respond_to :json
  before_action :authenticate_with_token!, only: [:index, :create, :destroy]

  def index

  end

  def show

  end

  def create
    if(params[:all])
      begin
        ActiveRecord::Base.transaction do
          Cart.where(user: @current_user).not_is_bought.each do |cart|
            # byebug
            Order.create!(name: params[:order][:name], street: params[:order][:street],
              district_id: params[:order][:district_id],provincial_id: params[:order][:provincial_id],
              product_id: cart.product.id, phone: params[:order][:phone], number: cart.number)
            cart.update(is_bought: true)
          end
        end
        render json: {notice: "Added"}, status: 201
      rescue
        render json: {errors: "Error"}, status: 422
      end
    else
      order = Order.new(order_params)
      if(order.save)
        render json: order, status: 201
      else
        render json: { errors: order.errors }, status: 422
      end
    end
  end

  private
  def order_params
    ms = Order.order(ms: :desc).empty? ? 1 : (Order.order(ms: :desc).first.ms + 1)
    params[:order][:ms] = ms
    params[:order][:phone] = params[:order][:phone].to_s
    params.require(:order).permit(:id, :name, :street, :provincial_id, :district_id, :product_id, :number, :size, :phone, :ms)
  end
end
