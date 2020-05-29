require 'mixpanel-ruby'

class GeneralMetrics::Adapters::Mixpanel
  attr_reader :tracker

  def initialize(options)
    @tracker = ::Mixpanel::Tracker.new(options.fetch(:secret))
    @logger = ::GeneralMetrics.logger
  end

  def publish(data)
    id = data.delete(:id)
    name = data.delete(:name)
    tracker.track(id, name, data)
  end
end
