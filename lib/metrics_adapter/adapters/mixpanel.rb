require 'mixpanel-ruby'

class MetricsAdapter::Adapters::Mixpanel
  attr_reader :tracker, :logger

  def initialize(options)
    @tracker = ::Mixpanel::Tracker.new(options.fetch(:secret))
    @logger = ::MetricsAdapter.logger
  end

  def publish(data)
    id = data.delete(:id)
    name = data.delete(:name)
    tracker.track(id, name, data)
  end
end
