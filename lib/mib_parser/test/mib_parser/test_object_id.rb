require 'minitest_helper'

class TestObjectId < Minitest::Test
  def test_initialize
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'brBOCCharacterSet', oid.name
  end

  def test_initialize_not_exist_oid
    assert_raises MIBParser::ObjectIdNotFound do
      MIBParser::ObjectId.new('0.0.0.0.0.0.0.0.0.0')
    end
  end

  def test_parse_value
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal 'ISO_8859_1', oid.parse('4')
  end

  def test_parser_charset
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.12.0')
    assert_equal MIBParser::Parser::Charset, oid.send(:parser).class
  end

  def test_parser_simple
    [
      '1.3.6.1.2.1.25.3.2.1.3.1',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.1.0',
      '1.3.6.1.2.1.2.2.1.6.1',
      '1.3.6.1.2.1.1.6.0',
      '1.3.6.1.2.1.1.4.0'
    ].each do |oid|
      assert_equal MIBParser::Parser::Simple, MIBParser::ObjectId.new(oid).send(:parser).class
    end
  end

  def test_parser_compisote
    [
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.11.0',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.18.0',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.21.0',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.59.0',

    ].each do |oid|
      assert_equal MIBParser::Parser::Composite, MIBParser::ObjectId.new(oid).send(:parser).class
    end
  end

  def test_parser_count_type
    [
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.2',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.21.1.2',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.1.1.2',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.2.1.2',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.3.1.2',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.4.1.2',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.42.1.2'
    ].each do |oid|
      assert_equal MIBParser::Parser::CountType, MIBParser::ObjectId.new(oid).send(:parser).class
    end
  end

  def test_parser_counter
    [
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.54.2.2.1.3',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.21.1.3',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.1.1.3',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.2.1.3',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.3.1.3',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.4.1.3',
      '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.52.42.1.3'
    ].each do |oid|
      assert_equal MIBParser::Parser::Counter, MIBParser::ObjectId.new(oid).send(:parser).class
    end
  end

  def test_parser_key_value
    [
      '1.3.6.1.4.1.2435.2.4.3.2435.5.36.41.0'
    ].each do |oid|
      assert_equal MIBParser::Parser::KeyValue, MIBParser::ObjectId.new(oid).send(:parser).class
    end
  end

  def test_parser_multi_status
    [
      '1.3.6.1.4.1.2435.2.4.3.2435.5.36.11.0'
    ].each do |oid|
      assert_equal MIBParser::Parser::MultiStatus, MIBParser::ObjectId.new(oid).send(:parser).class
    end
  end

  def test_parse_not_exist_type
    assert_raises MIBParser::ParserNotFound do
      oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.5.36.41.0')
      oid.define_singleton_method('type'){ 'dummy' }
      oid.parse('')
    end
  end
end
