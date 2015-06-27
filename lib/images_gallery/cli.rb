require 'thor'

require 'images_gallery'

module ImagesGallery
  class CLI < Thor

    desc 'generate SOURCE TARGET', 'Generate a static HTML images gallery in the TARGET directory from the SOURCE file contents.'
    def generate(source, target, error=STDERR, out=STDOUT)
      begin
        out.puts generator.run(source, target)
      rescue ImagesGallery::SourceFileNotFoundError
        error.puts 'ERROR: Please make sure the specified source file exists.'
      rescue ImagesGallery::TargetDirectoryNotFoundError
        error.puts 'ERROR: Please make sure the specified target directory exists.'
      rescue ImagesGallery::SourceFileInvalidError
        error.puts 'ERROR: The source file is invalid. Please check it is well-formed XML.'
      end
    end

    private

      def generator
        @generator ||= Generator.new
      end
  end
end
