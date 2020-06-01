
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metrics_adapter/version'

Gem::Specification.new do |spec|
  spec.name          = 'metrics_adapter'
  spec.version       = MetricsAdapter::VERSION
  spec.authors       = ['Form builder developers']
  spec.email         = ['form-builder-team@digital.justice.gov.uk']

  spec.summary       = %q{A gem that collect application metrics.}
  spec.description   = %q{Collect custom metrics from your application.}
  spec.homepage      = 'https://github.com/ministryofjustice/metrics_adapter'
  spec.license       = 'MIT'

  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'mixpanel-ruby'
  spec.add_dependency 'keen'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
