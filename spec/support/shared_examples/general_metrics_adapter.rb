shared_examples_for 'a general metrics adapter' do
  describe '#publish' do
    it 'respond to publish' do
      expect(adapter).to respond_to(:publish)
    end
  end
end
