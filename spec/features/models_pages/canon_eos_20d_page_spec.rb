require 'spec_helper'

describe 'The Canon EOS 20D model page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }

  before(:each) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    visit '/canon/canon_eos_20d.html'
  end

  it_behaves_like('an images gallery', 1, header_selector, navigation_selector, title_selector)
  it_behaves_like('a model page', 'canon', navigation_selector)

  describe 'navigation' do

    it 'contains a link to the ISO 100 page' do
      expect(page).to have_selector "#{navigation_selector} a[href='canon/canon_eos_20d/100.html']"
    end
  end
end
