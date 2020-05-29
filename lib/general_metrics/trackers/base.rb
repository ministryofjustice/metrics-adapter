module GeneralMetrics
  module Trackers
    class Base
      attr_reader :adapter,
                  :event,
                  :extra_attributes,
                  :logger,
                  :metric_name

      def initialize(event)
        adapter_name = GeneralMetrics.adapter.to_s.classify
        @adapter = "GeneralMetrics::Adapters::#{adapter_name}".constantize.new(
          GeneralMetrics.adapter_options
        )
        @event = event
        @extra_attributes = ::GeneralMetrics.extra_attributes
        @logger = ::GeneralMetrics.logger
        @metric_name = self.class.name.demodulize.underscore
      end

      def call
        raise NotImplementedError
      end
    end
  end
end
