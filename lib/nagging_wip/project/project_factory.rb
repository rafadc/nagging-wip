class ProjectFactory
  def for_config(config)
    if config.for(:mock_project)
      project = MockProject.new(config)
    elsif config.for(:pivotal_tracker_project)
      project = PivotalTrackerProject.new(config)
    end
  end
end
