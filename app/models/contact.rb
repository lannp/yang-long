class Contact < ActiveRecord::Base
  belongs_to :telephone
  belongs_to :address
end
