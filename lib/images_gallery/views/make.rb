require 'erb'

require 'images_gallery/view'

module ImagesGallery
  module Views
    class Make < ImagesGallery::View

      attr_reader :depth, :links, :make, :sample_images, :title
      private :depth, :links, :make, :sample_images, :title

      def initialize(images)
        super()

        @depth = 0
        @make = images.first.make
        @links = [{ name: "Browse all the images", href: link_to(depth, 'index') }]
        @links += images.models.map{ |model| { name: model, href: link_to(depth, make, model) } }
        @sample_images = images.first(10)
        @title = "Images by #{make}"
      end

      def template
        'lib/images_gallery/templates/layout.html.erb'
      end
    end
  end
end