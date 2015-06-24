require 'spec_helper'

module ImagesGallery
describe Collection do

  it { is_expected.to be_kind_of Array }

  it { is_expected.to respond_to :makes }
  it { is_expected.to respond_to :models }

end
end
