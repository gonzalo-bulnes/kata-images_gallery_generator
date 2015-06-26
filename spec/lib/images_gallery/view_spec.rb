require 'spec_helper'

module ImagesGallery
describe 'View' do

  let(:view) { View.new }

  it 'does not define :template' do
    expect { view.template }.to raise_error NotImplementedError
  end

end
end
