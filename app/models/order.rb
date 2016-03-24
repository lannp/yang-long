class Order < ActiveRecord::Base
  belongs_to :provincial
  belongs_to :district
end
