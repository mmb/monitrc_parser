module MonitrcParser

  describe ResourceTest do

    subject { Parser.new }

    it 'should parse a real value in a resource test' do
      input = <<-eos
check process mongodb
if totalmem > 1.5 GB for 2 cycles then restart
eos
      subject.parse(input)[0][:options][:if].value.should == 1.5
    end

    it 'should parse an integer value in a resource test' do
      input = <<-eos
check process mongodb
if totalmem > 500 MB for 2 cycles then restart
eos
      subject.parse(input)[0][:options][:if].value.should == 500
    end

    it 'should parse a resource test with cycles' do
      input = <<-eos
check process mongodb
if totalmem > 3000 Mb for 3 cycles then restart
eos
      subject.parse(input)[0][:options][:if].cycles.should == 3
    end

    it 'should parse a resource test without cycles' do
      input = <<-eos
check process mongodb
if totalmem > 3000 Mb then restart
eos
      subject.parse(input)[0][:options][:if].cycles.should be_nil
    end

  end

end
