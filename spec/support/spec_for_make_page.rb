RSpec.shared_examples 'a make page' do |navigation_selector|

  describe 'navigation' do

    it 'contains a link to the index page' do
      expect(page).to have_selector "#{navigation_selector} a[href='index.html']"
    end
  end
end
