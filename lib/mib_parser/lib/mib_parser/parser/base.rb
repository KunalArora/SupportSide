module MIBParser::Parser
  class Base
    def initialize object_id
      @oid = object_id
    end
    attr_reader :oid

    def parse _value
      raise 'This is not implemented.'
    end
  end
end
