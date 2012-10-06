require 'monitrc_parser'

module MonitrcParser

  describe CheckProcess do

    subject { Parser.new }

    it 'should parse a check process with no options' do
      input = <<-eos
check process apache
eos
      result = subject.parse(input)[0]

      result.should be_a(CheckProcess)
      result.name.should == 'apache'
    end

    it 'should parse a check process with a pidfile option' do
      input = <<-eos
check process apache
with pidfile /some/dir/some_process.pid
eos
      result = subject.parse(input)[0]

      result.options[:pidfile].should == '/some/dir/some_process.pid'
    end

    it 'should parse a check process with a start option' do
      input = <<-eos
check process apache
start program = "/some/dir/some_program start"
eos
      result = subject.parse(input)[0]

      result.options[:start][:command].should == '/some/dir/some_program start'
    end

    it 'should parse a check process with a start option without the optional =' do
      input = <<-eos
check process apache
start program "/some/dir/some_program start"
eos
      result = subject.parse(input)[0]

      result.options[:start][:command].should == '/some/dir/some_program start'
    end

    it 'should parse a check process with a stop option' do
      input = <<-eos
check process apache
stop program = "/some/dir/some_program stop"
eos
      result = subject.parse(input)[0]

      result.options[:stop][:command].should == '/some/dir/some_program stop'
    end

    it 'should parse a check process with a stop option without the optional =' do
      input = <<-eos
check process apache
stop program "/some/dir/some_program stop"
eos
      result = subject.parse(input)[0]

      result.options[:stop][:command].should == '/some/dir/some_program stop'
    end

    it 'should parse a check process with a group option' do
      input = <<-eos
check process redis
group group1
eos
      result = subject.parse(input)[0]

      result.options[:group].should == 'group1'
    end

    it 'should parse a check process with a mode active option' do
      input = <<-eos
check process mongodb
mode active
eos
      result = subject.parse(input)[0]

      result.options[:mode].should == 'active'
    end

    it 'should parse a check process with a mode manual option' do
      input = <<-eos
check process mongodb
mode manual
eos
      result = subject.parse(input)[0]

      result.options[:mode].should == 'manual'
    end

    it 'should parse a check process with a mode passive option' do
      input = <<-eos
check process mongodb
mode passive
eos
      result = subject.parse(input)[0]

      result.options[:mode].should == 'passive'
    end

    it 'should fail to parse a check process with a invalid mode option' do
      input = <<-eos
check process mongodb
mode foo
eos
      expect { subject.parse(input) }.to raise_error(ParseException)
    end

  end

end
