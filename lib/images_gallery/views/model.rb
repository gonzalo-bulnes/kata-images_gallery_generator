require 'erb'

require 'images_gallery/views/base'

module ImagesGallery
  module Views
    class Model < Base

      attr_reader :depth, :links, :make, :model, :sample_images, :title
      private :depth, :links, :make, :model, :sample_images, :title

      def initialize(images)
        super()

        @depth = 1
        @make = images.first.make
        @model = images.first.model
        @links = [{ name: "Browse all the images", href: link_to(depth, 'index') }]
        @links << { name: "Browse all the #{make} images", href: link_to(depth, make) }
        @sample_images = images
        @title = "Images by (#{make}) #{model}"
      end

      def template
        File.expand_path('../../templates/layout.html.erb', __FILE__)
      end
    end
  end
end
