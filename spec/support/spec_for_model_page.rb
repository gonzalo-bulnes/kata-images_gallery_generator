RSpec.shared_examples 'a model page' do |make, navigation_selector|

  describe 'navigation' do

    it 'contains a link to the index page' do
      expect(page).to have_selector "#{navigation_selector} a[href='../index.html']"
    end

    it 'contains a link to the make page' do
      expect(page).to have_selector "#{navigation_selector} a[href='../#{make}.html']"
    end
  end
end
