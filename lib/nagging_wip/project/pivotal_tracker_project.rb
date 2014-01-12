class PivotalTrackerProject
  attr_writer :pivotal_api

  def initialize(config)
    project_config = config.for(:pivotal_tracker_project)
    @max_wip = project_config['max_wip']
  end

  def current_wip
    @pivotal_api ||= PivotalAPIv5CurrentIterationReader.new(project_config['token'], project_config['project_id'])
    current = @pivotal_api.current_iteration
    current['stories'].select {|story| story['current_state']=='started' }.size
  end

  def max_wip
    @max_wip
  end
end
