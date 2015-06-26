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

  describe '#generate' do

    describe 'provides quick feedback on common errors' do

      context 'on SourceFileNotFoundError' do

        it 'outputs an error message about the missing source file' do
          stderr = double()
          allow(command_line_interface).to receive(:error).and_return(stderr)
          allow(command_line_interface).to receive_message_chain(:generator, :run) { raise ImagesGallery::SourceFileNotFoundError }

          expect(stderr).to receive_message_chain(:puts).with('Please make sure the specified source file exists.')
          command_line_interface.generate('source', 'target', stderr)
        end
      end

      context 'on TargetDirectoryNotFoundError' do

        it 'outputs an error message about the missing target directory' do
          stderr = double()
          allow(command_line_interface).to receive(:error).and_return(stderr)
          allow(command_line_interface).to receive_message_chain(:generator, :run) { raise ImagesGallery::TargetDirectoryNotFoundError }

          expect(stderr).to receive_message_chain(:puts).with('Please make sure the specified target directory exists.')
          command_line_interface.generate('source', 'target', stderr)
        end
      end

      context 'on SourceFileInvalidError' do

        it 'outputs an error message about the XML source file not being well-formed' do
          stderr = double()
          allow(command_line_interface).to receive(:error).and_return(stderr)
          allow(command_line_interface).to receive_message_chain(:generator, :run) { raise ImagesGallery::SourceFileInvalidError }

          expect(stderr).to receive_message_chain(:puts).with('The source file is invalid. Please check it is well-formed XML.')
          command_line_interface.generate('source', 'target', stderr)
        end
      end
    end
  end
end
end
