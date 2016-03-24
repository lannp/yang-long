class CategorySerializer < ActiveModel::Serializer
   delegate :current_user, to: :scope
  attributes :name, :link, :category_nds, :products

  def products
    if serialization_options[:get_index] && object.category_nds.count == 0
      # object.products.limit(4), each_serializer: ProductSerializer
      ActiveModel::ArraySerializer.new(object.products.limit(4), each_serializer: ProductSerializer,
        scope: current_user)
    end
  end

end
