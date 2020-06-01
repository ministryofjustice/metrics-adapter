## Request trackers:
##   1. Tracks slow request given a threshold
##
ActiveSupport::Notifications.subscribe('process_action.action_controller') do |event|
  if MetricsAdapter.trackers.include?(:slow_request)
    MetricsAdapter::Trackers::SlowRequest.new(event).call
  end
end
