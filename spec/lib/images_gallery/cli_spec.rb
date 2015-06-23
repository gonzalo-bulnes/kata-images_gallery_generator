require 'spec_helper'
require 'images_gallery/cli'

module ImagesGallery
describe CLI do

  let(:cli_class) { CLI }

  it 'should respond to .start' do
    expect(cli_class).to respond_to :start
  end
end
end
