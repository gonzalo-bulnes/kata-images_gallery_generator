require 'rack'

$:.push File.expand_path("../lib", __FILE__)

require 'images_gallery/test_application'

use Rack::Static, urls: [""], root: ImagesGallery::TestApplication::DEFAULT_TARGET, index: 'index.html'
run ImagesGallery::TestApplication
