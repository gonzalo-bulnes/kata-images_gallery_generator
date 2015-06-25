RSpec.shared_examples 'a collection' do

  it 'is a kind of Array' do
    expect(collection).to be_kind_of Array
  end

end
