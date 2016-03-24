class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :link, :auth_token, :avatar, :street, :provincial, :district, :phone

  def avatar
    object.avatar.url
  end

  # def provincial
  #   object.provincial.name
  # end

  # def district
  #   object.district.name
  # end
  # def carts
  #   if serialization_options[:get_cart]
  #     object.carts.where(is_bought: true)
  #   end
  # end
end
