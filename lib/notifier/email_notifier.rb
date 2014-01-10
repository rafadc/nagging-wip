class EmailNotifier
  def initialize(config, email_sender=EmailSender)
    raise 'Email configuration missing' unless config.for(:email)
    @email_config = config.for(:email)
    @email_sender = email_sender
  end

  def wip_exceeded
    @email_sender.send(@email_config["from"], 
                       @email_config["emails"].first,
                       @email_config["subject"],
                       @email_config["body"])
  end
end