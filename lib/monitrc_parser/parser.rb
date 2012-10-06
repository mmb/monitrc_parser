module MonitrcParser

  class Parser

    def initialize
      @parser = MonitrcParser.new
    end

    def parse(input)
      result = @parser.parse(input)

      unless result
        raise ParseException,
          "Parse error at character #{@parser.index}: #{input[@parser.index, 16]}"
      end

      result.content
    end
  end

end
