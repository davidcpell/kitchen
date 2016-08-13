require 'spec_helper'

describe 'ruby' do
  ruby_dir = File.join(Dir.home('david'), '.rbenv', 'versions', '2.3.1')

  describe file(ruby_dir) do 
    it { should be_directory }
  end
end
