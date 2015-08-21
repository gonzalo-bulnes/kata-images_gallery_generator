RSpec.shared_examples 'a view' do

  it 'responds to :render' do
    expect(view).to respond_to :render
  end

  it 'responds to :template' do
    expect(view).to respond_to :template
  end

  it 'defines :template' do
    expect { view.template }.not_to raise_error
  end

  context 'when built with no data' do

    it 'exits gracefully (?)'
  end
end
