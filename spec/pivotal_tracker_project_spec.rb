require 'spec_helper'

describe "Pivotal tracker project" do
  before :each do
    config = double("Configuration")
    config.stub(:for).with(:pivotal_tracker_project).and_return({
      'max_wip' => 4
    })
    @project = PivotalTrackerProject.new(config)
  end

  it "sets the WIP as said in the configuration" do
    expect(@project.max_wip).to eq(4)
  end

  context "current WIP" do
    before :each do
      @pivotal_api = double("Pivotal API")
      @project.pivotal_api = @pivotal_api
    end

    it 'is 0 on no stories' do
      @pivotal_api.stub(:current_iteration).and_return({
        'stories' => []
      })
      expect(@project.current_wip).to eq(0)
    end

    it 'is 1 on one started story' do
      @pivotal_api.stub(:current_iteration).and_return({
        'stories' => [{'current_state' => 'started'}]
      })
      expect(@project.current_wip).to eq(1)
    end

    it 'is 0 on one finished story' do
      @pivotal_api.stub(:current_iteration).and_return({
        'stories' => [{'current_state' => 'finished'}]
      })
      expect(@project.current_wip).to eq(0)
    end

    it 'is 1 on one started and one accepted story' do
      @pivotal_api.stub(:current_iteration).and_return({
        'stories' => [{'current_state' => 'started'}, {'current_state' => 'accepted'}]
      })
      expect(@project.current_wip).to eq(1)
    end

    it 'handles more complex cases' do
      @pivotal_api.stub(:current_iteration).and_return({
        'stories' => [{'current_state' => 'started'},
          {'current_state' => 'accepted'},
          {'current_state' => 'rejected'},
          {'current_state' => 'started'}]
      })
      expect(@project.current_wip).to eq(2)
    end
  end

end
