require 'rack'

require 'images_gallery/generator'

module ImagesGallery
  class TestApplication

    DEFAULT_TARGET = 'spec/tmp'

    def self.call(env)
      run Rack::Directory.new(DEFAULT_TARGET).call(env)
    end
  end
end
