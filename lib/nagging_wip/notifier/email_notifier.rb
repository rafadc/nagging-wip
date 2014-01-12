class EmailNotifier
  def initialize(config, email_sender=EmailSender)
    raise 'Email configuration missing' unless config.for(:email)
    @email_config = config.for(:email)
    @email_sender = email_sender
  end

  def wip_exceeded
    @email_config["emails"].each {|email| send_email email}
  end

  private
  def send_email(email)
    @email_sender.send({from: @email_config["from"],
                        to: email,
                        subject: @email_config["subject"],
                        body: @email_config["body"]},
                       {server:@email_config["smtp_server"],
                        port: @email_config["smtp_port"],
                        username: @email_config["username"],
                        password: @email_config["password"],
                        use_ssl: @email_config["use_ssl"]})
  end
end
