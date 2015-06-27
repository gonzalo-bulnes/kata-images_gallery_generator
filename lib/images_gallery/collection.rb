require 'images_gallery/models/image'

module ImagesGallery
  class Collection < Array

    def makes
      map { |image| image.make }.uniq.sort
    end

    def models
      map { |image| image.model }.uniq.sort
    end

  end
end
