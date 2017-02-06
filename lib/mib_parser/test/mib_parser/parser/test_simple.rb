require 'minitest_helper'

class TestParserSimple < Minitest::Test
  def test_device_type
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.25.3.2.1.3.1')
    result = MIBParser::Parser::Simple.new(oid).parse('42726f74686572204d46432d383935304457')
    assert_equal 'Brother MFC-8950DW', result['Device_Type']
  end

  def test_serial_number
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.1.0')
    result = MIBParser::Parser::Simple.new(oid).parse('303030473031323334353637383930')
    assert_equal '000G01234567890', result['Serial_Number']
  end

  def test_mac_address
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.2.2.1.6.1')
    result = MIBParser::Parser::Simple.new(oid).parse('001ba96e952f')
    assert_equal '001ba96e952f', result['Mac_Address']
  end

  def test_location
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.1.6.0')
    result = MIBParser::Parser::Simple.new(oid).parse('42726F7468657220E38396E383A9E382B6E383BC')
    assert_equal 'Brother ブラザー', result['Location'].encode('utf-8', 'utf-8')
  end

  def test_contact_latin2
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.1.4.0')
    result = MIBParser::Parser::Simple.new(oid).parse('a161')
    assert_equal 'Ąa', result['Contact'].encode('UTF-8', 'ISO-8859-2')
  end

  def test_contact_cyrillic
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.1.4.0')
    result = MIBParser::Parser::Simple.new(oid).parse('a161')
    assert_equal 'Ёa', result['Contact'].encode('UTF-8', 'ISO-8859-5')
  end

  def test_contact_latin5
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.1.4.0')
    result = MIBParser::Parser::Simple.new(oid).parse('a161')
    assert_equal '¡a', result['Contact'].encode('UTF-8', 'ISO-8859-9')
  end

  def test_contact
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.1.4.0')
    result = MIBParser::Parser::Simple.new(oid).parse('303132333435363738394142434445464748494a4b4c4d4e4f505152535455565758595a2d2a2f2b')
    assert_equal '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-*/+', result['Contact'].encode('UTF-8', 'UTF-8')
  end

  def test_contact_empty
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.1.4.0')
    result = MIBParser::Parser::Simple.new(oid).parse('')
    assert_equal '', result['Contact'].encode('UTF-8', 'UTF-8')
  end

  def test_device_type_odd_length
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.25.3.2.1.3.1')
    result = MIBParser::Parser::Simple.new(oid).parse('42726')
    assert_equal 'Br', result['Device_Type']
  end

  def test_hr_system_uptime
    oid = MIBParser::ObjectId.new('1.3.6.1.2.1.25.1.1.0')
    result = MIBParser::Parser::Simple.new(oid).parse('12345')
    assert_equal '12345', result['UpTime']
  end

  def test_proxy_server_name
    oid = MIBParser::ObjectId.new('1.3.6.1.4.1.2435.2.4.3.2435.10.1.12.1.3.1')
    result = MIBParser::Parser::Simple.new(oid).parse('70726F78792E62726F746865722E636F2E6A70')
    assert_equal 'proxy.brother.co.jp', result['Proxy_Server_Name']
  end
end
