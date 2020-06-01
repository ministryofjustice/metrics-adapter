module MetricsAdapter
  module Trackers
    class Base
      attr_reader :adapter,
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
      end

      def call
        raise NotImplementedError
      end
    end
  end
end
