require "spec_helper"

describe "ruby-build" do
  rbenv_dir = File.join(Dir.home("david"), ".rbenv", "plugins", "ruby-build")

  describe file(rbenv_dir) do 
    it { should be_directory }
  end
end
