module GeneralMetrics
  module Trackers
    class SlowRequest < Base
      attr_reader :slow_request_threshold

      def initialize(event)
        @slow_request_threshold = ::GeneralMetrics.thresholds.fetch(:slow_request)
        super
      end

      def call
        if event.duration > slow_request_threshold
          data = {
            id: event.transaction_id,
            name: metric_name,
            duration: (event.duration / 1000),
            method: event.payload[:method].to_s.downcase,
            cpu_time_in_ms: event.cpu_time,
            idle_time_in_ms: event.idle_time,
            path: event.payload[:path]
          }.merge(extra_attributes)
          adapter.publish(data)
        end
      end
    end
  end
end
