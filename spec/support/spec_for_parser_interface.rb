RSpec.shared_examples 'a parser' do

  it 'responds to :parse' do
    expect(parser).to respond_to :parse
  end
end
