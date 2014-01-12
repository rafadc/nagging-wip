class EmailSender
  def self.send(email, smtp_config)
    mail = Mail.new do
      from    email[:from]
      to      email[:to]
      subject email[:subject]
      body    email[:body]
    end
    mail.delivery_method :smtp,
                          address: smtp_config[:server],
                          port: smtp_config[:port],
                          user_name: smtp_config[:username],
                          password: smtp_config[:password],
                          enable_ssl: smtp_config[:enable_ssl]
    mail.deliver
  end
end
