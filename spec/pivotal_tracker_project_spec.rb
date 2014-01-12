require 'spec_helper'

describe "Pivotal tracker project" do
  it "sets the WIP as said in the configuration" do
    config = double("Configuration")
    config.stub(:for).with(:pivotal_tracker_project).and_return({
      'max_wip' => 4
    })
    project = PivotalTrackerProject.new(config)
    expect(project.max_wip).to eq(4)
  end

end