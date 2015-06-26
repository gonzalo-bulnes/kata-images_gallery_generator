require 'spec_helper'

describe 'The Leica make page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }

  before(:each) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    visit '/leica.html'
  end

  it_behaves_like('an images gallery', 5, header_selector, navigation_selector, title_selector)
  it_behaves_like('a make page', navigation_selector)

  describe 'navigation' do

    it 'contains a link to the only Leica camera model' do
      expect(page).to have_selector "#{navigation_selector} a", text: 'D-LUX 3'
    end

    it 'contains a link to the D-LUX3 camera model page' do
      expect(page).to have_selector "#{navigation_selector} a[href='leica/d_lux_3.html']"
    end
  end
end
