class NotifierFactory
  def for_config(config)
    if config.for(:console)
      notifier = ConsoleNotifier.new(config)
    elsif config.for(:email)
      notifier = EmailNotifier.new(config)
    end
  end
end