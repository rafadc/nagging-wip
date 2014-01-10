def nagging_wip(notifier, project, max_wip)
  notifier.wip_exceeded if project.current_wip > max_wip
end

describe "nagging wip notifier" do 
  before :each do
    @notifier = double("Notifier")
    @max_wip = 4
  end
    
  it "does not send a notification if WIP over the specified value" do
    project = double("Project", :current_wip => 4)
    @notifier.should_not_receive(:wip_exceeded)
    nagging_wip(@notifier, project, @max_wip)
  end

  it "does send a notification if WIP over the specified value" do
    project = double("Project", :current_wip => 7)
    @notifier.should_receive(:wip_exceeded)
    nagging_wip(@notifier, project, @max_wip)
  end
end