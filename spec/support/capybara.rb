require 'capybara/rspec'

require 'images_gallery/test_application'

test_target = ImagesGallery::TestApplication::DEFAULT_TARGET

FileUtils.mkdir_p(test_target) unless File.exists?(test_target)

Capybara.app = Rack::Builder.new do
  use Rack::Static, urls: [""], root: test_target, index: 'index.html'
  run ImagesGallery::TestApplication
end
