require "spec_helper"

describe "Oh My Zsh" do
  oh_my_zsh = File.join(Dir.home("david"), ".oh-my-zsh")

  describe file(oh_my_zsh) do 
    it { should be_directory }
  end
end
