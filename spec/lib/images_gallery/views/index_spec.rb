require 'spec_helper'

module ImagesGallery
describe 'Views::Index' do

  let(:data) do
    data = Collection.new
    data << Image.new
  end

  let(:view) { Views::Model.new(data) }

  it_behaves_like 'a view'

end
end
