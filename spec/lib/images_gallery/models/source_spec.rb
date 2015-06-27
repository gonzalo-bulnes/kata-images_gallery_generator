require 'spec_helper'

module ImagesGallery
describe 'Models::Source' do

  let(:source) { Models::Source.new('spec/fixtures/works.xml') }
  let(:parser) { source }

  it_behaves_like 'a parser'

  it { expect(source).to respond_to :images }

  describe '#images' do

    context 'once the source has been parsed' do

      describe 'is a collection of images' do

        it 'is a kind of Array' do
          source.parse
          expect(source.images).to be_kind_of Array
        end

        it 'is composed of images' do
          source.parse
          source.images.each do |image|

            # There is some duplication here that I couldn't remove.
            # See spec/support/spec_for_image_interface.

            #it_behaves_like 'an image'

            expect(image).to respond_to :description
            expect(image).to respond_to :make
            expect(image).to respond_to :model
            expect(image).to respond_to :src
          end
        end
      end
    end
  end
end
end
