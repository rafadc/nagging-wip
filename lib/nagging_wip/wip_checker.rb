class WipChecker
  def initialize(notifier, project)
    @notifier = notifier
    @project = project
  end

  def check_wip(max_wip)
    @notifier.wip_exceeded if @project.current_wip > max_wip
  end
end
