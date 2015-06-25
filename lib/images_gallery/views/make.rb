require 'erb'

require 'images_gallery/view'

module ImagesGallery
  module Views
    class Make < ImagesGallery::View

      attr_reader :links, :make, :sample_images, :title
      private :links, :make, :sample_images, :title

      def initialize(images)
        super()

        @make = images.first.make
        @links = [{ name: "Browse all the images", href: "index.html" }]
        @links += images.models.map{ |model| { name: model, href: "#{make.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}/#{model.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}.html" } }
        @sample_images = images.first(10)
        @title = "Images by #{make}"
      end

      def template
        'lib/images_gallery/templates/layout.html.erb'
      end
    end
  end
end
