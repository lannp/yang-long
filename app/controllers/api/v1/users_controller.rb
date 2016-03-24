class Api::V1::UsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  # before_action :authenticate_with_token!, only: [:update, :destroy]

  respond_to :json

  def index
    if(params[:more])
    users = User.load_more_user(params[:more])
    else
      users = User.all
    end
    render json: users, each_serializer: UserSerializer
  end

  def show
    user = User.find(params[:id]) rescue  User.find_by(link: params[:id])
    carts = user.carts.where(is_bought: true)
    # user = ActiveModel::UserSerializer.new(user).to_json
    # user.as_json(only:[:id, :name, :email, :link, :auth_token, :avatar, :street, :town, :district])
    json = {id: user.id, name: user.name, email: user.email, link: user.link, auth_token: user.auth_token,
      avatar: user.avatar.url, street: user.street, provincial: user.provincial, district: user.district, phone: user.phone }
    total_cart = carts.count
    carts = carts.page(params[:page]).per_page(2)
    carts = ActiveModel::ArraySerializer.new(carts, each_serializer: CartSerializer)
    render json: {user: json, carts: carts, page: params[:page], total_cart: total_cart}
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
    user = User.find(params[:id]) rescue  User.find_by(link: params[:id])
    if user.update(user_params)
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422, serializer: UserSerializer, get_post: true
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    head 204
  end

  private

    def user_params
      params.require(:user).permit(:id, :name,:link, :email,:street, :provincial_id, :district_id, :phone, :password, :password_confirmation, :avatar)
    end

end
