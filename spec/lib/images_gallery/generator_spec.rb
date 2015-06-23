require 'spec_helper'

module ImagesGallery
describe 'Generator' do

  let(:generator) { Generator.new('spec/fixtures/works.xml', 'spec/tmp') }

  it { expect(generator).to respond_to :run }

end
end
