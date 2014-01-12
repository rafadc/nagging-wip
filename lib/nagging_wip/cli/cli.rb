class CLI
  def run(config)
    notifier = NotifierFactory.new.for_config(config)
    project = ProjectFactory.new.for_config(config)
    WipChecker.new(notifier, project).check_wip
  end
end