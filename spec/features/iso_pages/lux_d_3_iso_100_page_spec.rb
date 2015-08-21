require 'spec_helper'

describe 'The LUX-D 3 @ ISO 100 page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }

  before(:each) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    visit '/leica/d_lux_3/100.html'
  end

  it_behaves_like('an images gallery', 3, header_selector, navigation_selector, title_selector)
  it_behaves_like('an ISO page', 'leica', 'd_lux_3', navigation_selector)
end
