class Category < ActiveRecord::Base
  has_many :category_nds
  has_many :category_products
  has_many :products, through: :category_products
  before_create :set_link

  def set_link
    self.link = self.name.gsub(/\W/,"-")
    # self.save
  end
end
