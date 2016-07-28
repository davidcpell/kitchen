require "spec_helper"

home = Dir.home('david')

describe ".zshrc" do 
  zshrc = File.join(home, '.zshrc')

  describe file(zshrc) do 
    it { should be_file }
  end
end

describe ".vimrc" do
  vimrc = File.join(home, '.vimrc')

  describe file(vimrc) do
    it { should be_file }
  end
end

describe '.tmux.conf' do
  tmuxconf = File.join(home, '.tmux.conf')

  describe file(tmuxconf) do 
    it { should be_file }
  end
end
