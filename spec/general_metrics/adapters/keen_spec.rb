RSpec.describe GeneralMetrics::Adapters::Keen do
  it_behaves_like 'a general metrics adapter' do
    let(:adapter) { described_class.new(project_id: 'foo', write_key: 'bar') }
  end
end
