require 'keen'

class GeneralMetrics::Adapters::Keen
  attr_reader :project_id, :write_key

  def initialize(options)
    @project_id = options.fetch(:project_id)
    @write_key = options.fetch(:write_key)
  end

  def publish(data)
    name = data.delete(:name)

    ::Keen.project_id = project_id
    ::Keen.write_key = write_key

    ::Keen.publish(name, data)
  end
end
