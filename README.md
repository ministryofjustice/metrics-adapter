# GeneralMetrics

A simple gem that collects application data to send to a metrics service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'general_metrics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install general_metrics

## Setup

You can setup the following adapters/services:

1. Mixpanel - https://mixpanel.com/
2. Keen - https://keen.io/

## Setup Mixpanel

Below we setup Mixpanel service using the slow request tracker:

```ruby
  # config/initializer/general_metrics.rb
  require 'general_metrics/rails'

  GeneralMetrics.configure do |config|
    config.adapter = :mixpanel
    config.adapter_options = { secret: 'my-secret' }
    config.extra_attributes = { app: 'My-App' }
    config.logger = Rails.logger
    config.trackers = %i(slow_request)
    config.thresholds = { slow_request: 1_000 }
  end
```

## Setup Keen

Below we setup the Keen service using the slow request tracker:

```ruby
  # config/initializer/general_metrics.rb
  require 'general_metrics/rails'

  GeneralMetrics.configure do |config|
    config.adapter = :keen
    config.adapter_options = {
      project_id: 'my-project-id',
      write_key: 'my-write-key',
    }
    config.extra_attributes = { app: 'My-App' }
    config.logger = Rails.logger
    config.trackers = %i(slow_request)
    config.thresholds = { slow_request: 1_000 }
  end
```

## Metrics

For the first version, we support for now, the rails event 'process_action.action_controller'.

We will add more trackers as we go. We can pickup ideas from [rails docs](https://guides.rubyonrails.org/active_support_instrumentation.html#sql-active-record)

### Slow request

If the request time is bigger than the slow request threshold, then the event
will be published by the adapter.

The threshold can be setup by:

```ruby
    config.thresholds = { slow_request: 1_000 }
```

This will tell the gem to send metrics only if the request time are greater than
1 second.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
