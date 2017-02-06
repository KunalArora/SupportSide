module MIBParser
  class ObjectId
    def initialize oid
      mib = MIB.load
      unless mib.key? oid
        raise ObjectIdNotFound, "#{oid} is not found."
      end
      @oid = oid
      mib = mib[oid]

      mib.each_key do |k|
        define_singleton_method(k) do
          mib[k]
        end
      end
    end
    attr_reader :oid

    def parse value
      parser.parse(value)
    end

    private
    def parser
      type = self.type.split('_').collect(&:capitalize).join
      unless Parser.const_defined? type.to_sym
        raise ParserNotFound, "'#{type}' is not defined."
      end
      Object.const_get("MIBParser::Parser::#{type}").new(self)
    end
  end
end
