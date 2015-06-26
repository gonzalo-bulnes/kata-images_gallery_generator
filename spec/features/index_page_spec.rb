require 'spec_helper'

describe 'The index page', type: :feature do

  let!(:generator) { ImagesGallery::Generator.new }
  let!(:images) do
    generator.run('spec/fixtures/works.xml', 'spec/tmp/')
    generator.instance_variable_get('@source').send(:images)
  end

  before(:each) do
    visit '/'
  end

  it_behaves_like('an images gallery', 10, header_selector, navigation_selector, title_selector)

  it 'displays a list of all the camera makes' do
    images.makes.each do |make|
      expect(page).to have_content "#{make}"
    end
  end

  describe 'navigation' do

    it 'is composed by as many links as there are camera makes' do
      expect(page).to have_selector "#{navigation_selector} a", count: images.makes.count
    end

    it 'contains a link to each camera make page' do
      images.makes.each do |make|
        make_page = "#{make.to_filename}.html"
        expect(page).to have_selector "#{navigation_selector} a[href=\"#{make_page}\"]"
      end
    end
  end
end
