require 'libxml'

require 'images_gallery/collection'
require 'images_gallery/models/image'

module ImagesGallery
  class Source

    include LibXML
    include XML::SaxParser::Callbacks

    attr_reader :images

    # Provides a collection of images to presenters
    #
    # Extracts some images attributes from an XML collection of works
    # and collects the images as plain Ruby objects so other classes
    # can use them with presentational purpose.
    #
    # This class should be able to parse efficiently large XML files.
    #
    # file - Path to an XML representation of the images (metadata, EXIF)
    #
    # Example:
    #
    #     source = ImagesGallery::Source.new('path/to/source.xml')
    #     source.parse   # creates a Collection of Images
    #     source.images  # is available after parsing
    #
    # Returns a Source object, ready to parse the corresponding XML file.
    def initialize(file)
      @file = XML::SaxParser.file(file)
      @file.callbacks = self
    end

    def parse
      @images = Collection.new
      begin
        @file.parse
      rescue LibXML::XML::Error
        raise SourceFileInvalidError
      end
    end

    # Callbacks can't be private, yet they are not part of the public API.

    def on_start_element(element, attributes)
      @current_element = element

      if element == 'work'
        @current_image = Models::Image.new
      end

      if element == 'url' && attributes['type'] == 'small'
        @current_element = 'thumbnail URL'
      end
    end

    def on_end_element(element)
      if element == 'work'
        @images << @current_image
      end

      if element == 'id'
        @current_image.id = @current_id
      end

      if element == 'make'
        @current_image.make = @current_make
      end

      if element == 'model'
        @current_image.model = @current_model
      end

      if @current_element == 'thumbnail URL'
        @current_image.src = @current_src
      end

      @current_element = nil
    end

    def on_characters(char)
      if @current_element == 'id'
        @current_id = char
      end

      if @current_element == 'make'
        @current_make = char
      end

      if @current_element == 'model'
        @current_model = char
      end

      if @current_element == 'thumbnail URL'
        @current_src = char
      end
    end

    def on_end_document
      @current_element = nil
    end
  end
end
