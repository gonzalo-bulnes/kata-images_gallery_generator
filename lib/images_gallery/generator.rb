module ImagesGallery
  class Generator

    attr_reader :source, :target
    private :source, :target

    def initialize(source, target, error=STDERR)
      @source = source if File.file? source
      @target = target if File.directory? target
    end

    def run
    end

  end
end
