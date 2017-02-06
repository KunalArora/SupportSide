module MIBParser::Parser
  class Counter < Base
    def parse value
      value.to_s
    end
  end
end
