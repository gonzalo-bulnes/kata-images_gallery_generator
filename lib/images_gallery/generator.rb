require 'images_gallery/errors'
require 'images_gallery/source'
require 'images_gallery/views/index'
require 'images_gallery/views/make'
require 'images_gallery/views/model'

module ImagesGallery
  class Generator

    attr_reader :target
    private :target

    def run(source, target)

      raise SourceFileNotFoundError unless File.file? source
      raise TargetDirectoryNotFoundError unless File.directory? target

      @source = Source.new(source)
      @target = target

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
          dir_path = "#{target}/#{name}".gsub('//', '/')
          file_path = dir_path + '.html'
          FileUtils.mkdir_p(dir_path) unless File.exists?(dir_path) || (name == 'index')
          File.open(file_path, 'w') do |file|
            file.write content
          end
        end
      end
  end
end
