require 'spec_helper'

module ImagesGallery
describe 'Views::Base' do

  let(:view) { Views::Base.new }

  it 'does not define :template' do
    expect { view.template }.to raise_error NotImplementedError
  end

end
end
