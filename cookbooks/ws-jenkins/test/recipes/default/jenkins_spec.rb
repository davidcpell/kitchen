describe service('jenkins') do 
  it { should be_running }
  it { should be_enabled }
end
