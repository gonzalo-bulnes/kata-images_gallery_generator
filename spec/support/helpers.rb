module Selectors
  def navigation_selector
    'nav'
  end

  def header_selector
    'header'
  end

  def title_selector
    { 'head' => 'title', 'body' => 'h1' }
  end
end

module ViewHelpers
  def images_collection
    ImagesGallery::Models::Collection.new << ImagesGallery::Models::Image.new
  end
end

RSpec.configure do |config|
  config.extend Selectors
  config.include Selectors
  config.include ViewHelpers
end
