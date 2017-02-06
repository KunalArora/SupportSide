module MIBParser::Parser
  class Charset < Base
  
    DEFAULT_CHARSET = 'ISO_8859_1'

    def parse value
      result = DEFAULT_CHARSET
      if oid.id_map.key? value
        result = oid.id_map[value]
      end
      result
    end
  end
end
