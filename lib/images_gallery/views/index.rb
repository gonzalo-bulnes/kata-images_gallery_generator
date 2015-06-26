require 'erb'

require 'images_gallery/view'

module ImagesGallery
  module Views
    class Index < ImagesGallery::View

      attr_reader :depth, :links, :sample_images, :title
      private :depth, :links, :sample_images, :title

      def initialize(images)
        super()

        @depth = 0
        @links = images.makes.map{ |make| { name: make, href: link_to(depth, make) } }
        @sample_images = images.first(10)
        @title = 'Index'
      end

      def template
        'lib/images_gallery/templates/layout.html.erb'
      end
    end
  end
end