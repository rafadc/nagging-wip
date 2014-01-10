require 'spec_helper'

describe "Email notification" do
  before :each do
    @config = double("Config")
    @mailer = double("Mailer")
    @email_config = {'from' => "from@domain.com",
                       'subject' => "Wip surpassed",
                       'body' => "Check it NOW!",
                       'server' => 'my_address',
                       'port' => 'my_port'}
  end

  it "raises an exception if no configuration has been specified" do
    @config.stub(:for).with(:email)
    expect{EmailNotifier.new(@config)}.to raise_error
  end

  it "sends an email with correct attributes if a single address has been specified" do
    @email_config['emails'] = ['sample@domain.com']
    @config.stub(:for).with(:email).and_return(@email_config)
    @mailer.should_receive(:send).with({from: 'from@domain.com', to: 'sample@domain.com', subject: 'Wip surpassed', body: 'Check it NOW!'}, anything())
    notifier = EmailNotifier.new(@config, @mailer)
    notifier.wip_exceeded
  end

  it "sends an email with correct attributes if a multiple address have been specified" do
    @email_config['emails'] = ['sample@domain.com', 'other@domain.com']
    @config.stub(:for).with(:email).and_return(@email_config)
    @mailer.should_receive(:send).with({from: 'from@domain.com', to: 'sample@domain.com', subject: 'Wip surpassed', body: 'Check it NOW!'}, anything())
    @mailer.should_receive(:send).with({from: 'from@domain.com', to: 'other@domain.com', subject: 'Wip surpassed', body: 'Check it NOW!'}, anything())
    notifier = EmailNotifier.new(@config, @mailer)
    notifier.wip_exceeded
  end
end