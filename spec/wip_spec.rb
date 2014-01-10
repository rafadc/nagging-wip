require 'spec_helper'

describe "nagging wip notifier" do 
  before :each do
    @notifier = double("Notifier")
    @project = double("Project")
    @wip_checker = WipChecker.new(@notifier, @project)
    @max_wip = 4
  end
    
  it "does not send a notification if current WIP under the specified value" do
    @project.stub(:current_wip => 4)
    @notifier.should_not_receive(:wip_exceeded)
    @wip_checker.check_wip(@max_wip)
  end

  it "does send a notification if current WIP over the specified value" do
    @project.stub(:current_wip => 7)
    @notifier.should_receive(:wip_exceeded)
    @wip_checker.check_wip(@max_wip)
  end
end