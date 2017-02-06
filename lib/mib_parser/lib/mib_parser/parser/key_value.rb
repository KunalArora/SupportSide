module MIBParser::Parser
  class KeyValue < Base
    
    DEFAULT_IGNORE_KEYS = %w(STATUS)
    
    def parse value
      result = {}
      return result if value.nil?

      value.each_line do |line|
        line.split('=').each_cons(2) do |k, v|
          next if DEFAULT_IGNORE_KEYS.include? k
          result[k] = v.strip.gsub(/^\"|\"$/, '')
        end
      end
      result
    end
  end
end
