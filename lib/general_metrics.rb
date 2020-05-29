require 'general_metrics/version'
require 'active_support/all'

module GeneralMetrics
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
    autoload :Mixpanel, 'general_metrics/adapters/mixpanel'
  end

  module Trackers
    autoload :Base, 'general_metrics/trackers/base'
    autoload :SlowRequest, 'general_metrics/trackers/slow_request'
  end

  def self.configure(&block)
    yield self
  end
end
