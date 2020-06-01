require 'metrics_adapter/version'
require 'active_support/all'

module MetricsAdapter
  mattr_accessor :adapter
  mattr_accessor :logger

  mattr_accessor :adapter_options
  self.adapter_options = {}

  mattr_accessor :extra_attributes
  self.extra_attributes = {}

  mattr_accessor :trackers
  self.trackers = []

  mattr_accessor :thresholds
  self.thresholds = {}

  module Adapters
    autoload :Mixpanel, 'metrics_adapter/adapters/mixpanel'
    autoload :Keen, 'metrics_adapter/adapters/keen'
  end

  module Trackers
    autoload :Base, 'metrics_adapter/trackers/base'
    autoload :SlowRequest, 'metrics_adapter/trackers/slow_request'
  end

  def self.configure(&block)
    yield self
  end
end
