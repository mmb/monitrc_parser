require 'monitrc_parser'

module MonitrcParser

  describe CheckProcess do

    subject { MonitrcParser.new }

    it 'should parse a simple check process' do
      input = <<-eos
check process apache
with pidfile /some/process/some.pid
eos
      result = subject.parse(input).content[0]

      result.should be_a(CheckProcess)
      result.name.should == 'apache'
      result.pidfile.should == '/some/process/some.pid'
    end

  end

end
