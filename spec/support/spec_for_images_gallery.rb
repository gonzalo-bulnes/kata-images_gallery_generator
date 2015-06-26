RSpec.shared_examples 'an images gallery' do |thumbnails, header_selector, navigation_selector, title_selector|

  it 'has a <title/>' do
    expect(page).to have_selector title_selector['head'], visible: false
  end

  it "displays #{thumbnails} thumbnails" do
    expect(page).to have_selector 'img', count: thumbnails
  end

  describe 'header' do

    it 'is contains the navigation' do
      expect(page).to have_selector "#{header_selector} #{navigation_selector}"
    end

    it 'is contains the page title' do
      expect(page).to have_selector "#{header_selector} #{title_selector['body']}"
    end
  end

  describe 'navigation' do

    it 'is contained by a <nav/> element' do
      expect(page).to have_selector navigation_selector
    end
  end
end
