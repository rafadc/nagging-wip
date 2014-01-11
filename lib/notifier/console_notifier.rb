class ConsoleNotifier
  def initialize(config)
    @console_config = config.for(:console)
  end

  def wip_exceeded
    puts @console_config['message']
  end
end