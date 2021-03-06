require 'images_gallery/errors'
require 'images_gallery/models/collection'
require 'images_gallery/models/source'
require 'images_gallery/views/index'
require 'images_gallery/views/make'
require 'images_gallery/views/model'
require 'images_gallery/views/iso'

module ImagesGallery
  class Generator

    attr_reader :target
    private :target

    def run(source, target)

      raise SourceFileNotFoundError unless File.file? source
      raise TargetDirectoryNotFoundError unless File.directory? target

      @source = Models::Source.new(source)
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
          images_by_make = Models::Collection.new
          images.select{ |image| image.make == make }.each do |image|
            images_by_make << image
            view = Views::Make.new(images_by_make)
            files[view.file_identifier(image.make)] = view.render

            images_by_make.models.each do |model|
              images_by_model = Models::Collection.new
              images_by_make.select{ |image| image.model == model }.each do |image|
                images_by_model << image
                view = Views::Model.new(images_by_model)
                files[view.file_identifier(image.make, image.model)] = view.render

                images_by_model.iso_values.each do |iso_value|
                  images_by_iso_value = Models::Collection.new
                  images_by_model.select{ |image| image.iso == iso_value }.each do |image|
                    images_by_iso_value << image
                    view = Views::ISO.new(images_by_iso_value)
                    files[view.file_identifier(image.make, image.model, image.iso)] = view.render
                  end
                end
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
          @index_path = file_path if name == 'index'
          FileUtils.mkdir_p(parent(dir_path)) unless File.exists?(dir_path) || (name == 'index')
          File.open(file_path, 'w') do |file|
            file.write content
          end
        end
        @index_path
      end

      def parent(dir_path)
        return dir_path.match('(.*)\/.*$').captures.first unless dir_path.match('(.*)\/.*$').nil?
        '.'
      end
  end
end
