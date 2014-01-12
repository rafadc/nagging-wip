require 'spec_helper'

describe 'Project factory' do
  before :each do
    @config = double('Configuration')
    @factory = ProjectFactory.new
  end

  it 'creates an email notifier if configuration for one' do
    @config.stub(:for).with(:mock_project)
    @config.stub(:for).with(:pivotal_tracker_project).and_return({})
    notifier = @factory.for_config(@config)
    expect(notifier).to be_kind_of(PivotalTrackerProject)
  end

  it 'creates a console notifier if configuration for one' do
    @config.stub(:for).with(:mock_project).and_return({})
    @config.stub(:for).with(:pivotal_tracker_project)
    notifier = @factory.for_config(@config)
    expect(notifier).to be_kind_of(MockProject)
  end
end