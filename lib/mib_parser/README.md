# MIBParser

This is a parser for a MIB value written in pure Ruby.

## Installation

    $ gem install mib_parser

## Usage

Parse a value of MIB:

    require 'mib_parser'
    
    p MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0')
      .parse('31010400000001320104000000023301040000000334010400000004FF')
    # {"TonerInk_Black"=>"1", "TonerInk_Cyan"=>"2", "TonerInk_Magenta"=>"3", "TonerInk_Yellow"=>"4"}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
