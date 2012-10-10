module MonitrcParser

  describe ResourceTest do

    subject { Parser.new }

    it 'should parse a real value in a resource test' do
      input = <<-eos
check process mongodb
if totalmem > 1.5 GB for 2 cycles then restart
eos
      subject.parse(input)[0][:options][:if]['value'].should == 1.5
    end

    it 'should parse an integer value in a resource test' do
      input = <<-eos
check process mongodb
if totalmem > 500 MB for 2 cycles then restart
eos
      subject.parse(input)[0][:options][:if]['value'].should == 500
    end

  end

end
