require 'images_gallery/models/image'

module ImagesGallery
  module Models
    class Collection < Array

      def makes
        map { |image| image.make }.uniq.sort
      end

      def models
        map { |image| image.model }.uniq.sort
      end

      def iso_values
        map { |image| image.iso }.uniq.sort
      end

    end
  end
end
