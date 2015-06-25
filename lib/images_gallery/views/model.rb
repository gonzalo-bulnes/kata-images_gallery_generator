require 'erb'

require 'images_gallery/view'

module ImagesGallery
  module Views
    class Model < ImagesGallery::View

      attr_reader :links, :make, :model, :sample_images, :title
      private :links, :make, :model, :sample_images, :title

      def initialize(images)
        super()

        @make = images.first.make
        @model = images.first.model
        @links = [{ name: "Browse all the images", href: "../index.html" }]
        @links << { name: "Browse all the #{make} images", href: "../#{make.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}.html" }
        @sample_images = images
        @title = "Images by (#{make}) #{model}"
      end

      def template
        'lib/images_gallery/templates/layout.html.erb'
      end
    end
  end
end
