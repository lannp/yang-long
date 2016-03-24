class CategoryNd < ActiveRecord::Base
  belongs_to :category
  has_many :products

  before_create :set_link

  def set_link
    self.link = self.name.gsub(/\W/,"-")
    # self.save
  end
end
