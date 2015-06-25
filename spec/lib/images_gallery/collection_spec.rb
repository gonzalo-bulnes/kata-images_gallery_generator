require 'spec_helper'

module ImagesGallery
describe 'Collection' do

  let(:collection) { Collection.new }

  it_behaves_like 'a collection'

  it { expect(collection).to respond_to :makes }
  it { expect(collection).to respond_to :models }

end
end
