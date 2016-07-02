require "spec_helper"

describe "my workstation user" do
  describe user("david") do
    it { should exist }
    it { should have_login_shell "/bin/zsh" }
  end
end
