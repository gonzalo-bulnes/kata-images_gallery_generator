require 'spec_helper'

describe 'The Canon make page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }

  before(:each) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    visit '/canon.html'
  end

  it_behaves_like('an images gallery', 2, header_selector, navigation_selector, title_selector)
  it_behaves_like('a make page', navigation_selector)

  describe 'navigation' do

    it 'contains a link to the two Canon camera models' do
      expect(page).to have_selector "#{navigation_selector} a", text: 'Canon EOS 20D'
      expect(page).to have_selector "#{navigation_selector} a", text: 'Canon EOS 400D DIGITAL'
    end

    it 'contains a link to the Canon EOS 20D camera model page' do
      expect(page).to have_selector "#{navigation_selector} a[href='canon/canon_eos_20d.html']"
    end

    it 'contains a link to the Canon EOS 400D DIGITAL camera model page' do
      expect(page).to have_selector "#{navigation_selector} a[href='canon/canon_eos_400d_digital.html']"
    end
  end
end
