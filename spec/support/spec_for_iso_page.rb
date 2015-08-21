RSpec.shared_examples 'an ISO page' do |model, navigation_selector|

  describe 'navigation' do

    it 'contains a link to the index page' do
      expect(page).to have_selector "#{navigation_selector} a[href='../../index.html']"
    end

    it 'contains a link to the model page' do
      expect(page).to have_selector "#{navigation_selector} a[href='../#{model}.html']"
    end

    it 'contains a link to the make page' do
      pending 'May be an interesting extension.'
    end
  end
end