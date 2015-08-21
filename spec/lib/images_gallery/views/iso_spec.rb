require 'spec_helper'

module ImagesGallery
describe 'Views::Iso' do

  let(:data) { images_collection }
  let(:view) { Views::Iso.new(data) }

  it_behaves_like 'a view'

end
end
