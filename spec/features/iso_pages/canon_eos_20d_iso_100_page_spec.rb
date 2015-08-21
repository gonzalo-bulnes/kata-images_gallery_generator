require 'spec_helper'

describe 'The Canon EOS 20D @ ISO 100 page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }

  before(:each) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    visit '/canon/canon_eos_20d/100.html'
  end

  it_behaves_like('an images gallery', 1, header_selector, navigation_selector, title_selector)
  it_behaves_like('an ISO page', 'canon', 'canon_eos_20d', navigation_selector)
end
