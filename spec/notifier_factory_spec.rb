require 'spec_helper'

describe 'Notifier factory' do
  before :each do
    @config = double('Configuration')
    @factory = NotifierFactory.new
  end

  it 'creates an email notifier if configuration for one' do
    @config.stub(:for).with(:console)
    @config.stub(:for).with(:email).and_return({})
    notifier = @factory.for_config(@config)
    expect(notifier).to be_kind_of(EmailNotifier)
  end

  it 'creates a console notifier if configuration for one' do
    @config.stub(:for).with(:console).and_return({})
    notifier = @factory.for_config(@config)
    expect(notifier).to be_kind_of(ConsoleNotifier)
  end
end