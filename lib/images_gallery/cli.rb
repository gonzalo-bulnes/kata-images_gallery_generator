require 'thor'

require 'images_gallery/generator'

module ImagesGallery
  class CLI < Thor

    desc 'generate SOURCE TARGET', 'Generate a static HTML images gallery in the TARGET directory from the SOURCE file contents.'
    def generate(source, target=nil)
      generator.run(source, target)
    end

    private

      def generator
        @generator ||= Generator.new
      end
  end
end
