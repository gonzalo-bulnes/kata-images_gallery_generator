RSpec.shared_examples 'a view' do

  it 'responds to :link_to' do
    expect(view).to respond_to :link_to
  end

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

  describe '#link_to' do

    let(:depth) { 1 }

    context 'when provided a depth and a make' do

      it 'generates a make page URL' do
        expect(view.link_to(depth, 'make')).to eq '../make.html'
      end
    end

    context 'when provided a depth, a make and a model' do

      it 'generates a model page URL' do
        expect(view.link_to(depth, 'make', 'model')).to eq '../make/model.html'
      end
    end
  end
end
