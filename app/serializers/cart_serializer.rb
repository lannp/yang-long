class CartSerializer < ActiveModel::Serializer
  attributes :id, :product, :number, :total_price, :total

  def product
    products = Product.find(object.product_id)
  end

  def total_price
    if serialization_options[:get_total_price]

      price = 0
      Cart.where(user: object.user).each do |cart|
       price += cart.product.sale? ? (cart.number* cart.product.sale) : (cart.number * cart.product.price)
      end
      return price
    end
  end

  def total
    if serialization_options[:get_total_price]
      total = 0
      Cart.where(user: object.user).each do |cart|
       total += cart.number
      end
      return total
    end
  end
end
