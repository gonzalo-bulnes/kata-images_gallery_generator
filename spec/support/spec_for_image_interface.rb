RSpec.shared_examples 'an image' do

  it 'responds to :description' do
    expect(image).to respond_to :description
  end

  it 'responds to :make' do
    expect(image).to respond_to :make
  end

  it 'responds to :model' do
    expect(image).to respond_to :model
  end

  it 'responds to :src' do
    expect(image).to respond_to :src
  end
end
