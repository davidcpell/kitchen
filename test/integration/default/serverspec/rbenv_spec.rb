require "spec_helper"

describe "rbenv" do
  rbenv_dir = File.join(Dir.home("david"), ".rbenv")

  describe file(rbenv_dir) do 
    it { should be_directory }
  end
end
