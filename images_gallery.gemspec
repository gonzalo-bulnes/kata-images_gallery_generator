$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "images_gallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name          = "images_gallery"
  gem.version       = ImagesGallery::VERSION
  gem.authors       = ["Gonzalo Bulnes Guilpain"]
  gem.email         = ["gon.bulnes@gmail.com"]
  gem.summary       = %q{Generate efficient galleries of thumbnails from large XML representations of EXIF data.}
  gem.description   = %q{Generate a set of static HTML files from an XML representation of EXIF data so users can browse a collection of images.}
  gem.homepage      = "https://github.com/gonzalo-bulnes/kata-images_gallery_generator"
  gem.license       = "GPL-3.0"

  gem.files = Dir["{bin, doc,lib}/**/*", "Gemfile", "LICENSE", "Rakefile", "README.md", "config.ru"]
  gem.test_files = Dir["spec/**/*"]

  gem.add_dependency 'libxml-ruby', '~> 2.0'
  gem.add_dependency 'thor', '~> 0.19.1'

  gem.add_development_dependency 'capybara', '~> 2.0'
  gem.add_development_dependency 'inch', '~> 0.6'
  gem.add_development_dependency 'rack', '~> 1.0'
  gem.add_development_dependency 'rainbow', '~> 2.0'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'rubycritic', '~> 1.0'
end
