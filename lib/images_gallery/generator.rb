require 'images_gallery/source'

module ImagesGallery
  class Generator

    attr_reader :source, :target
    private :source, :target

    def run(source, target, error=STDERR)
      @source = Source.new(source) if File.file? source
      @target = target if File.directory? target

      @source.parse
      # @source.images is now available
    end

  end
end
