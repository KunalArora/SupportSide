module MIBParser
  module Parser
    autoload :Base, 'mib_parser/parser/base'
    autoload :Charset, 'mib_parser/parser/charset'
    autoload :Composite, 'mib_parser/parser/composite'
    autoload :CountType, 'mib_parser/parser/count_type'
    autoload :Counter, 'mib_parser/parser/counter'
    autoload :MultiStatus, 'mib_parser/parser/multi_status'
    autoload :KeyValue, 'mib_parser/parser/key_value'
    autoload :Simple, 'mib_parser/parser/simple'
  end
end
