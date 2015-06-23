require 'spec_helper'

module ImagesGallery
describe 'Generator' do

  let(:generator) { Generator.new('spec/fixtures/works.xml', 'spec/tmp') }

  it_behaves_like 'a generator'

end
end
