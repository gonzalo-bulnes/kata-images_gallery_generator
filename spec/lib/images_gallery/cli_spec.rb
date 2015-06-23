require 'spec_helper'
require 'images_gallery/cli'

module ImagesGallery
describe CLI do

  let(:command_line_interface) { CLI }

  it { expect(command_line_interface).to respond_to :start }
end
end
