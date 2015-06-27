require 'spec_helper'

module ImagesGallery
describe 'Models::Collection' do

  let(:collection) { Models::Collection.new }

  it_behaves_like 'a collection'

  it { expect(collection).to respond_to :makes }
  it { expect(collection).to respond_to :models }

end
end
