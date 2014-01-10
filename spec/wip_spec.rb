def nagging_wip(notifier, project, max_wip)
end

describe "nagging wip notifier" do 
	it "does not send a notification if WIP over the specified value" do
    notifier = double("Notifier")
    project = double("Project")
    max_wip = 4
    project.stub(:curent_wip).and_return(2)
    nagging_wip(notifier, project, max_wip)
    notifier.should_not_receive(:wip_exceeded)
  end

  it "does send a notification if WIP over the specified value" do
    notifier = double("Notifier")
    project = double("Project")
    max_wip = 4
    project.stub(:curent_wip).and_return(7)
    nagging_wip(notifier, project, max_wip)
    notifier.should_receive(:wip_exceeded)
  end
end