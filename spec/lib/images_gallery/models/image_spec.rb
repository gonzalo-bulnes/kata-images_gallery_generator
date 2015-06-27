require 'spec_helper'

module ImagesGallery
describe 'Models::Image' do

  let(:image) { Models::Image.new }

  it_behaves_like 'an image'

end
end
