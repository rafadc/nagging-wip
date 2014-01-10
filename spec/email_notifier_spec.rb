require 'spec_helper'

describe "Email notification" do
  it "does raise an exception if no configuration has been specified" do
    config = double("Config")
    config.stub(:for).with(:email).and_return(nil)
    expect{EmailNotifier.new(config)}.to raise_error
  end
end