require 'erb'

module ImagesGallery
  class View

    def initialize
      @template = File.new(template)
    end

    def template
      raise NotImplementedError
    end

    def render
      ERB.new(File.new(template).read).result(binding)
    end

    def thumbnails(images)
      template = 'lib/images_gallery/templates/_thumbnails.html.erb'
      ERB.new(File.new(template).read).result(binding)
    end

    def navigation(links)
      template = 'lib/images_gallery/templates/_navigation.html.erb'
      ERB.new(File.new(template).read).result(binding)
    end

    def link_to(depth, make, model=nil)
      ('../' * depth) + file_identifier(make, model) + '.html'
    end

    def file_identifier(make, model=nil)
      if model.nil?
        "#{make.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}"
      else
        "#{make.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}/#{model.downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')}"
      end
    end
  end
end
