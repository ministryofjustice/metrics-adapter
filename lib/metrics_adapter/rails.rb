## Request trackers:
##   1. Tracks slow request given a threshold
##
ActiveSupport::Notifications.subscribe('process_action.action_controller') do |event|
  trackers = MetricsAdapter.trackers
  conditional = MetricsAdapter.conditionals[:slow_request]

  if conditional.present? && conditional.call.blank?
    Rails.logger.info('Metrics Adapter wont publish slow request metric.')
  else
    MetricsAdapter::Trackers::SlowRequest.new(event).call if trackers.include?(:slow_request)
  end
end
