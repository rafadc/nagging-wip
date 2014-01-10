require 'spec_helper'

describe "Email notification" do
  before :each do
    @config = double("Config")
    @mailer = double("Mailer")
  end
    
  it "raises an exception if no configuration has been specified" do
    @config.stub(:for).with(:email)
    expect{EmailNotifier.new(@config)}.to raise_error
  end

  it "sends an email with correct attributes if a single address has been specified" do
    @config.stub(:for).with(:email).and_return({'from' => "from@domain.com", 
                                               'subject' => "Wip surpassed", 
                                               'body' => "Check it NOW!",
                                               'emails' => ["sample@domain.com"]})
    @mailer.should_receive(:send).with("from@domain.com", "sample@domain.com", "Wip surpassed", "Check it NOW!")
    notifier = EmailNotifier.new(@config, @mailer)
    notifier.wip_exceeded
  end    
end