RSpec.shared_examples 'a generator' do

  it 'responds to :run' do
    expect(generator).to respond_to :run
  end

  describe '#run' do

    context 'when called with a unexistent file' do
      it { expect{ generator.run('missing.xml', 'spec/tmp/') }.to raise_error ImagesGallery::SourceFileNotFoundError }
    end

    context 'when called with an unexistent target directory' do
      it { expect{ generator.run('spec/fixtures/works.xml', 'spec/tmp/missing') }.to raise_error ImagesGallery::TargetDirectoryNotFoundError }
    end

    context 'when called with a file path as second argument (instead of a driectory path)' do
      it { expect{ generator.run('spec/fixtures/works.xml', 'spec/tmp/missing') }.to raise_error ImagesGallery::TargetDirectoryNotFoundError }
    end

    it 'accepts a file path and a directory path as arguments' do
      expect{ generator.run('spec/fixtures/works.xml', 'spec/tmp/') }.not_to raise_error
    end
  end
end
