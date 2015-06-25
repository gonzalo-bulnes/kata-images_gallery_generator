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
      # @source.images is now available

      images = @source.images

      # render templates
      @files = {}

      index = Views::Index.new(images)
      @files['index'] = index.render

      images.makes.each do |make|
        images_by_make = Collection.new
        images.select{ |image| image.make == make }.each do |image|
          images_by_make << image
          @files["#{make.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}"] = Views::Make.new(images_by_make).render

          images_by_make.models.each do |model|
            images_by_model = Collection.new
            images_by_make.select{ |image| image.model == model }.each do |image|
              images_by_model << image
              @files["#{make.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}/#{model.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}"] = Views::Model.new(images_by_model).render
            end
          end
        end
      end

      # create files
      @files.each do |name, content|
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
