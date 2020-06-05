module MetricsAdapter
  module Trackers
    class Base
      attr_reader :adapter,
                  :conditional,
                  :event,
                  :extra_attributes,
                  :logger,
                  :metric_name

      def initialize(event)
        adapter_name = MetricsAdapter.adapter.to_s.classify
        @adapter = "MetricsAdapter::Adapters::#{adapter_name}".constantize.new(
          MetricsAdapter.adapter_options
        )
        @event = event
        @extra_attributes = ::MetricsAdapter.extra_attributes
        @logger = ::MetricsAdapter.logger
        @metric_name = self.class.name.demodulize.underscore
        @conditional = ::MetricsAdapter.conditionals[@metric_name.to_sym]
      end

      def call
        raise NotImplementedError
      end
    end
  end
end
