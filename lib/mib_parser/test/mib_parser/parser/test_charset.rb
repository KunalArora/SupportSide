require 'minitest_helper'

class TestParserCharset < Minitest::Test
  def test_parse_latin1
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'ISO_8859_1', MIBParser::Parser::Charset.new(oid).parse('4')
  end

  def test_parse_latin2
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'ISO_8859_2', MIBParser::Parser::Charset.new(oid).parse('5')
  end

  def test_parse_cyrillic
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'ISO_8859_5', MIBParser::Parser::Charset.new(oid).parse('8')
  end

  def test_parse_latin5
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'ISO_8859_9', MIBParser::Parser::Charset.new(oid).parse('12')
  end

  def test_parse_sjis
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'UTF-8', MIBParser::Parser::Charset.new(oid).parse('17')
  end

  def test_parse_utf8
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'UTF-8', MIBParser::Parser::Charset.new(oid).parse('106')
  end

  def test_parse_romain8
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'ISO_8859_1', MIBParser::Parser::Charset.new(oid).parse('2004')
  end
end
