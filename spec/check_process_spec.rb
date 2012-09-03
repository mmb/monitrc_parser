require 'monitrc_parser'

module MonitrcParser

  describe CheckProcess do

    subject { MonitrcParser.new }

    it 'should parse a check process with no options' do
      input = <<-eos
check process apache
eos
      result = subject.parse(input).content[0]

      result.should be_a(CheckProcess)
      result.name.should == 'apache'
    end

    it 'should parse a check process with a pidfile option' do
      input = <<-eos
check process apache
with pidfile /some/dir/some_process.pid
eos
      result = subject.parse(input).content[0]

      result.options[:pidfile].should == '/some/dir/some_process.pid'
    end

  end

end
