require 'spec_helper'

describe 'ruby' do
  ruby_v = 'runuser -l david -c "PATH=/home/david/.rbenv/shims:$PATH ruby -v"'

  describe command(ruby_v) do 
    its(:stdout) { puts `whoami`; should match /2.3.1/ }
  end
end
