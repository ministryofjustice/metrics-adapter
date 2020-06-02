RSpec.describe MetricsAdapter::Adapters::Mixpanel do
  it_behaves_like 'a general metrics adapter' do
    let(:adapter) { described_class.new(secret: 'foo') }
  end
end
