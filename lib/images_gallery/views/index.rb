require 'erb'

require 'images_gallery/view'

module ImagesGallery
  module Views
    class Index < ImagesGallery::View

      attr_reader :links, :sample_images, :title
      private :links, :sample_images, :title

      def initialize(images)
        super()

        @links = images.makes.map{ |make| { name: make, href: "#{make.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}.html" } }
        @sample_images = images.first(10)
        @title = 'Index'
      end

      def template
        'lib/images_gallery/templates/layout.html.erb'
      end
    end
  end
end
