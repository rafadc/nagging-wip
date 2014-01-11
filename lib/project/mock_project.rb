class MockProject
  def initialize(config)
    @project_config = config.for(:mock_project)
  end

  def current_wip
    @project_config['current_wip']
  end
end