class Cart < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validate :is_bought
  validates :user, presence: true, uniqueness: { scope: :product }
  # validates :product, presence: true, uniqueness: true
  scope :not_is_bought, ->{where(is_bought: false)}
end
