class CLI
  def run
    config = FileConfiguration.new
    if config.for(:console)
      notifier = ConsoleNotifier.new(config)
    elsif config.for(:email)
      notifier = EmailNotifier.new(config)
    end
    if config.for(:mock_project)
      project = MockProject.new(config)
    end
    WipChecker.new(notifier, project)
  end
end