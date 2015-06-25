require 'images_gallery/source'
require 'images_gallery/views/index'
require 'images_gallery/views/make'
require 'images_gallery/views/model'

module ImagesGallery
  class Generator

    attr_reader :source, :target
    private :source, :target

    def run(source, target, error=STDERR)
      @source = Source.new(source) if File.file? source
      @target = target if File.directory? target

      @source.parse
      files = render_views(@source.images)
      generate(target, files)
    end

    private

      def render_views(images)
        files = {}

        files['index'] = Views::Index.new(images).render

        images.makes.each do |make|
          images_by_make = Collection.new
          images.select{ |image| image.make == make }.each do |image|
            images_by_make << image
            view = Views::Make.new(images_by_make)
            files[view.file_identifier(image.make)] = view.render

            images_by_make.models.each do |model|
              images_by_model = Collection.new
              images_by_make.select{ |image| image.model == model }.each do |image|
                images_by_model << image
                view = Views::Model.new(images_by_model)
                files[view.file_identifier(image.make, image.model)] = view.render
              end
            end
          end
        end
        files
      end

      def generate(target, files)
        files.each do |name, content|
          file_path = target + name
          file_url = file_path + '.html'
          FileUtils.mkdir_p(file_path) unless File.exists?(file_path)
          File.open(file_url, 'w') do |file|
            file.write content
          end
        end
      end
  end
end
