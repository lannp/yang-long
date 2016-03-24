class ProductSerializer < ActiveModel::Serializer
  delegate :current_user, to: :scope
  attributes :id, :name, :description, :ms, :picture, :price, :sale, :size, :material, :category_nd_id, :cart

  def cart
    # byebug
    object.carts.where(user: scope)
  end

  def picture
    object.picture.url
  end
end
