require 'erb'

require 'images_gallery/views/base'

module ImagesGallery
  module Views
    class ISO < Base

      attr_reader :depth, :links, :iso, :make, :model, :sample_images, :title
      private :depth, :links, :iso, :make, :model, :sample_images, :title

      def initialize(images)
        super()

        @depth = 2
        @make = images.first.make
        @model = images.first.model
        @iso = images.first.iso
        @links = [{ name: "Browse all the images", href: link_to(depth, 'index') }]
        @links << { name: "Browse all the #{model} images", href: link_to(depth, make, model) }
        @sample_images = images
        @title = "Images by (#{make}) #{model} @ ISO #{iso}"
      end

      def template
        File.expand_path('../../templates/layout.html.erb', __FILE__)
      end
    end
  end
end
