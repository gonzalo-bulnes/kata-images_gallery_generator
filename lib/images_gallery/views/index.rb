require 'erb'

require 'images_gallery/views/base'

module ImagesGallery
  module Views
    class Index < Base

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
        File.expand_path('../../templates/layout.html.erb', __FILE__)
      end
    end
  end
end
