require 'erb'

module ImagesGallery
  module Views
    class Base

      # Provides context and helpers to the corresponding template
      #
      # Any variable defined in the context of this class will be accessible
      # from the corresponding ERb template.
      # See http://ruby-doc.org/stdlib-2.2.2/libdoc/erb/rdoc/ERB.html#method-i-result
      #
      # Usage:
      #
      # Do not instanciate this class, define subclasses instead an define their
      # template methods as demonstrated in Views::Index.
      #
      # Conventionally, templates could be stored in images_gallery/templates, but
      # there is no obligation to follow the convention.
      #
      # This class not meant to be instanciated, subclasses do return View instances (kind of).
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
        template = File.expand_path('../../templates/_thumbnails.html.erb', __FILE__)
        ERB.new(File.new(template).read).result(binding)
      end

      def navigation(links)
        template = File.expand_path('../../templates/_navigation.html.erb', __FILE__)
        ERB.new(File.new(template).read).result(binding)
      end

      def link_to(depth, make, model=nil, iso_value=nil)
        ('../' * depth) + file_identifier(make, model) + '.html'
      end

      def file_identifier(make, model=nil, iso_value=nil)
        if model.nil?
          "#{make.to_filename}"
        elsif iso_value.nil?
          "#{make.to_filename}/#{model.to_filename}"
        else
          "#{make.to_filename}/#{model.to_filename}/#{iso_value.to_filename}"
        end
      end
    end
  end
end
