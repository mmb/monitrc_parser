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

    it 'should parse a check process with a start option' do
      input = <<-eos
check process apache
start program = "/some/dir/some_program start"
eos
      result = subject.parse(input).content[0]

      result.options[:start][:command].should == '/some/dir/some_program start'
    end

    it 'should parse a check process with a start option without the optional =' do
      input = <<-eos
check process apache
start program "/some/dir/some_program start"
eos
      result = subject.parse(input).content[0]

      result.options[:start][:command].should == '/some/dir/some_program start'
    end

    it 'should parse a check process with a stop option' do
      input = <<-eos
check process apache
stop program = "/some/dir/some_program stop"
eos
      result = subject.parse(input).content[0]

      result.options[:stop][:command].should == '/some/dir/some_program stop'
    end

    it 'should parse a check process with a stop option without the optional =' do
      input = <<-eos
check process apache
stop program "/some/dir/some_program stop"
eos
      result = subject.parse(input).content[0]

      result.options[:stop][:command].should == '/some/dir/some_program stop'
    end

    it 'should parse a check process with a group option' do
      input = <<-eos
check process redis
group group1
eos
      result = subject.parse(input).content[0]

      result.options[:group].should == 'group1'
    end

  end

end
