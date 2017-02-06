require 'strscan'

module MIBParser::Parser
  class Composite < Base
   
    HEX_LEN = 2
    TERMINATER = 'FF'
    CAN_DISPLAY = '01'
    
    def parse value
      result = {}
      return result if value.nil?

      s = StringScanner.new(value)
      until s.eos? || s.peek(HEX_LEN).casecmp(TERMINATER).zero?
        idx = s.scan(/\w{#{HEX_LEN}}/)
        should_display = oid.display ? (s.scan(/\w{#{HEX_LEN}}/) == CAN_DISPLAY) : true
        len = s.scan(/\w{#{HEX_LEN}}/).hex
        val = s.scan(/\w{#{len * HEX_LEN}}/)
        if should_display && oid.id_map.key?(idx)
          if oid.respond_to? :format
            val = oid.format['format'] % val.scan(oid.format['regexp']).map(&:hex)
          else
            val = val.hex
          end
          result[oid.id_map[idx]] = val.to_s
        end
      end
      result
    end
  end
end
