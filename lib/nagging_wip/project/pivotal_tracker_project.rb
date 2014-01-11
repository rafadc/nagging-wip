class PivotalTrackerProject
  def initialize(config)
    project_config = config.for(:pivotal_tracker_project)
    @max_wip = project_config['max_wip']
    @token = project_config['token']
    @current_iteration_url="https://www.pivotaltracker.com/services/v5/projects/#{project_config['project_id']}/iterations?scope=current"
  end

  def current_wip
    resource_uri = URI.parse(@current_iteration_url)
    response = Net::HTTP.start(resource_uri.host, resource_uri.port,
                               use_ssl: resource_uri.scheme == 'https',
                               verify_mode: OpenSSL::SSL::VERIFY_NONE) do |https|
      https.get(@current_iteration_url, {'X-TrackerToken' => @token})
    end
    iteration = JSON.parse(response.body)
    iteration[0]['stories'].select {|story| story['current_state']=='started' }.size
  end

  def max_wip
    @max_wip
  end
end
