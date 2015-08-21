require 'spec_helper'

module ImagesGallery
describe 'Views::ISO' do

  let(:data) { images_collection }
  let(:view) { Views::ISO.new(data) }

  it_behaves_like 'a view'

end
end
