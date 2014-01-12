class PivotalAPIv5CurrentIterationReader
  def initialize(token, project_id)
    @token = token
    @project_id = project_id
    @current_iteration_url="https://www.pivotaltracker.com/services/v5/projects/#{project_id}/iterations?scope=current"
  end

  def current_iteration
    resource_uri = URI.parse(@current_iteration_url)
    response = Net::HTTP.start(resource_uri.host, resource_uri.port,
                               use_ssl: resource_uri.scheme == 'https',
    verify_mode: OpenSSL::SSL::VERIFY_NONE) do |https|
      https.get(@current_iteration_url, {'X-TrackerToken' => @token})
    end
    iterations = JSON.parse(response.body)
    iterations[0]
  end
end
