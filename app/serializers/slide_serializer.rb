class SlideSerializer < ActiveModel::Serializer
  attributes :id, :picture, :description

  def picture
    object.picture.url
  end

end
