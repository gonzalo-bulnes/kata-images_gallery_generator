require 'spec_helper'

module ImagesGallery
describe 'Image' do

  let(:image) { Image.new }

  it_behaves_like 'an image'

end
end
