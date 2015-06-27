require 'spec_helper'

module ImagesGallery
describe 'Views::Index' do

  let(:data) { images_collection }
  let(:view) { Views::Model.new(data) }

  it_behaves_like 'a view'

end
end
