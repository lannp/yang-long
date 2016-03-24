class Slide < ActiveRecord::Base
  mount_uploader :picture, SlideUploader
end
