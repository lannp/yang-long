class CategoryNdSerializer < ActiveModel::Serializer
  delegate :current_user, to: :scope
  attributes :name, :link, :products

  def products
     ActiveModel::ArraySerializer.new(object.products.limit(4), each_serializer: ProductSerializer,
        scope: current_user)
  end
end
