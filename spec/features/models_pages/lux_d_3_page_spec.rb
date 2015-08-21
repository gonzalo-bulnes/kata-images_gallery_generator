require 'spec_helper'

describe 'The LUX-D 3 model page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }

  before(:each) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    visit '/leica/d_lux_3.html'
  end

  it_behaves_like('an images gallery', 5, header_selector, navigation_selector, title_selector)
  it_behaves_like('a model page', 'leica', navigation_selector)

  describe 'navigation' do

    it 'contains a link to the ISO 200 page' do
      expect(page).to have_selector "#{navigation_selector} a[href='../leica/d_lux_3/200.html']"
    end

    it 'contains a link to the ISO 100 page' do
      expect(page).to have_selector "#{navigation_selector} a[href='../leica/d_lux_3/100.html']"
    end
  end
end
