 class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :auth_token, uniqueness: true
  before_create :generate_authentication_token!

  has_many :carts
  mount_uploader :avatar, AvatarUploader
  belongs_to :provincial
  belongs_to :district

  before_create :set_link

  def set_link
    self.link = self.name.gsub(/\W/,"-")
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
