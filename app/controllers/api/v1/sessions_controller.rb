class Api::V1::SessionsController < ApplicationController
  respond_to :json
   # skip_before_action :verify_authenticity_token
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    # byebug
    user = user_email.present? && User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200, location: [:api, user], serializer: UserSerializer
    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end
end
