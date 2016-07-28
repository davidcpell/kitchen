require "spec_helper"

describe "tmux" do
  describe command("tmux -V") do
    # its(:exit_status) { should eq 0 }
  end

  describe file("/usr/local/bin/tmux") do 
    it { should exist }
  end
end
