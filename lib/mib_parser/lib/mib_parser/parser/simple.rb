module MIBParser::Parser
  class Simple < Base
    def parse value
      result = {}
      return result if value.nil?

      case oid.data_type
      when 'integer', 'binary_display_string'
        result[oid.id_map['0']] = value
      when 'octet_string', 'octet_string_supports_utf8'
        result[oid.id_map['0']] = value.scan(/../).map{|b| b.to_i(16)}.pack('C*')
      else
      end
      result
    end
  end
end
