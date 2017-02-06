require 'strscan'

module MIBParser::Parser
  class MultiStatus < Base
   
    STATUS_LEN = 3
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
        val = s.scan(/\w{#{STATUS_LEN * HEX_LEN}}/)
        if should_display && oid.id_map.key?(idx)
          result[oid.id_map[idx]] = val.hex.to_s
        end
      end
      result
    end
  end
end
