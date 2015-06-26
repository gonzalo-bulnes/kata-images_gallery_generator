require 'spec_helper'

describe 'The LUX-D 3 model page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }

  before(:each) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    visit '/leica/d_lux_3.html'
  end

  it_behaves_like('an images gallery', 5, header_selector, navigation_selector, title_selector)
  it_behaves_like('a model page', 'leica', navigation_selector)
end
