RSpec.shared_examples 'a generator' do

  it 'responds to :run' do
    expect(generator).to respond_to :run
  end
end
