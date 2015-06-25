require 'spec_helper'
require 'images_gallery/cli'

module ImagesGallery
describe 'CLI' do

  let(:cli_class) { CLI }
  let(:command_line_interface) { CLI.new }

  it 'should respond to .start' do
    expect(cli_class).to respond_to :start
  end

  it { expect(command_line_interface).to respond_to :generate }
end
end
