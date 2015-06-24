require 'images_gallery/image'

module ImagesGallery
  class Collection < Array

    def makes
      map { |image| image.make }
    end

    def models
      map { |image| image.model }
    end
  end
end
