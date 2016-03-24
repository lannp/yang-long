class Product < ActiveRecord::Base
  belongs_to :category_nd
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carts

  mount_uploader :picture, ProductPicUploader
  scope :price_in_0_100, ->{where(price: 0..100)}
  scope :price_in_100_200, ->{where(price: 100..200)}
  scope :price_in_200_300, ->{where(price: 200..300)}
  scope :price_over_300, ->{where("price>=30")}
end
