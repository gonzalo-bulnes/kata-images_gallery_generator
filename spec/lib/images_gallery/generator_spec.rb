require 'spec_helper'

module ImagesGallery
describe 'Generator' do

  let(:generator) { Generator.new }

  it_behaves_like 'a generator'

end
end
