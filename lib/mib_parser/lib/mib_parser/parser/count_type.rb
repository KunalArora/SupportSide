module MIBParser::Parser
  class CountType < Base
    def parse value
      oid.id_map[value.to_s]
    end
  end
end
