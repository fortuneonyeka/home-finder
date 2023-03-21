module PropertiesHelper

  def property_thumbnail
    img = property.image.present? ? property.image : "placeholder.jpg"
    image_tag img, class:"property-thumb"
  end
end
