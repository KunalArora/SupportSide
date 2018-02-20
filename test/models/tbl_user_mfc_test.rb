require 'test_helper'
require 'csv'
class TblUserMfcTest < ActiveSupport::TestCase
  include CsvUtility

  test 'should download csvfile whose columns are correct' do
    CSV.foreach("test/columns.csv") do |row|
      num = row.size
      num.times.each do |i|
        assert_equal row[i], CsvColumns[i]
      end
    end
  end

  test 'should download selected items only when checkbox is checked' do
    check = {device_id: ["da23bd9a-86da-2580-cefa-d05acfff7eb4"]}
    device_informations = TblUserMfc.get_device_information_csv(tbl_users(:foo).uid, check)
    assert_equal 2, device_informations.scan(/\n/).size
    assert_equal 1, device_informations.scan(/da23bd9a-86da-2580-cefa-d05acfff7eb4/).size
  end

  test 'should download items correctly' do
    check = {device_id: ["da23bd9a-86da-2580-cefa-d05acfff7eb4"]}
    device_informations = TblUserMfc.get_device_information_csv(tbl_users(:foo).uid, check)
    sample = CSV.read("test/download_csv_sample.csv")
    sample.flatten.size.times.each do |i|
      assert_equal sample.flatten[i], device_informations.gsub(/\n/, ',').split(',')[i]
    end
  end

  test 'should get date list' do
    data = [
      {"updated"=> ["2016-06-30T20:00:00+00:00", "2016-07-30T20:00:00+00:00",
        "2016-08-30T20:00:00+00:00", "2016-09-30T20:00:00+00:00", "2016-10-30T20:00:00+00:00",
        "2016-11-30T20:00:00+00:00", "2016-12-30T20:00:00+00:00", "2017-01-30T20:00:00+00:00",
        "2017-02-28T20:00:00+00:00", "2017-03-30T20:00:00+00:00", "2017-04-30T20:00:00+00:00",
        "2017-05-30T20:00:00+00:00", "2017-06-30T11:00:00+00:00"
        ]
      },
      {"updated" => ["2016-06-30T20:00:00+00:00", "2016-08-30T20:00:00+00:00",
        "2016-09-30T20:00:00+00:00", "2016-11-30T20:00:00+00:00", "2017-02-28T20:00:00+00:00",
        "2017-04-30T20:00:00+00:00"
        ],
      }
    ]

    result = ["2016-06-30T20:00:00+00:00", "2016-07-30T20:00:00+00:00",
              "2016-08-30T20:00:00+00:00", "2016-09-30T20:00:00+00:00",
              "2016-10-30T20:00:00+00:00", "2016-11-30T20:00:00+00:00",
              "2016-12-30T20:00:00+00:00", "2017-01-30T20:00:00+00:00",
              "2017-02-28T20:00:00+00:00", "2017-03-30T20:00:00+00:00",
              "2017-04-30T20:00:00+00:00", "2017-05-30T20:00:00+00:00",
              "2017-06-30T11:00:00+00:00"
    ]
    assert_equal(result, date_list(data))
  end

  test 'should get csv_string' do
    device_id = "device_id"
    basic_info = ["device_type", "serial", "mac_address"]
    column = ["DeviceID", "Device_Type", "Serial_Number", "Mac_Address", "Location", "Contact"]
    values = {
      "2016-09-30T20:00:00+00:00" => ["location1", "contact1"],
      "2016-08-30T20:00:00+00:00" => ["location2", "contact2"]
    }
    assert_equal("DeviceID,Device_Type,Serial_Number,Mac_Address,Location,Contact\ndevice_id,30/09/2016 20:00,device_type,serial,mac_address,location1,contact1\ndevice_id,30/08/2016 20:00,device_type,serial,mac_address,location2,contact2\n", to_csv(column, values, basic_info, device_id))
  end

  test 'should get date and notification values' do
    date_list = ["2017-04-30T20:00:00+00:00", "2017-05-30T20:00:00+00:00", "2017-06-30T11:00:00+00:00", "2017-07-30T11:00:00+00:00"]
    response_data = [{
      "feature" => "Location",
      "value" => ["japan", "US"],
      "updated" => ["2017-06-30T11:00:00+00:00", "2017-05-30T20:00:00+00:00"]
    }]
    features = ["Location", "Contact"]
    result = {"2017-07-30T11:00:00+00:00"=>["japan", "-"], "2017-06-30T11:00:00+00:00"=>["japan", "-"], "2017-05-30T20:00:00+00:00"=>["US", "-"], "2017-04-30T20:00:00+00:00"=>["-", "-"]}
    assert_equal(result, create_csv_format_notification_log(date_list, response_data, features))
  end

  test 'should get date and network status values' do
    date_list = ["2017-06-30T11:00:00+00:00", "2017-05-30T20:00:00+00:00", "2017-04-30T20:00:00+00:00"]
    response_data = {
      "value" => ["online", "offline"],
      "updated" => ["2017-06-30T11:00:00+00:00", "2017-05-30T20:00:00+00:00"]
    }
    result = {"2017-06-30T11:00:00+00:00"=>["online"], "2017-05-30T20:00:00+00:00"=>["offline"], "2017-04-30T20:00:00+00:00"=>["-"]}
    assert_equal(result, create_csv_format_network_status_log(date_list, response_data))
  end

  test 'should get parameter about time' do
    device = TblUserMfc.new
    param_1day = {period: 'last_1_day'}
    param_7days = {period: 'last_7_days'}
    param_1month = {period: 'last_1_month'}
    param_1year = {period: 'last_1_year'}
    param_specific_p = {
      period: 'specific_period',
      to: '11/11/2017',
      from: '10/11/2017',
      time_unit: 'daily'
    }
    param_specific_d = {
      period: 'specific_date',
      date: '11/11/2017'
    }
    data_1day = device.period(param_1day)
    data_7days = device.period(param_7days)
    data_1month = device.period(param_1month)
    data_1year = device.period(param_1year)
    data_specific_p = device.period(param_specific_p)
    data_specific_d = device.period(param_specific_d)
    assert_equal(0.0, data_1day[:to].yesterday-data_1day[:from])
    assert_equal(0.0, data_7days[:to].ago(7.days)-data_7days[:from])
    assert_equal(0.0, data_1month[:to].prev_month-data_1month[:from])
    assert_equal(0.0, data_1year[:to].prev_year-data_1year[:from])
    assert_equal('2017-11-11 23:59:59 UTC', "#{data_specific_p[:to]}")
    assert_equal('2017-11-10 00:00:00 UTC', "#{data_specific_p[:from]}")
    assert_equal('2017-11-11 23:59:59 UTC', "#{data_specific_d[:to]}")
    assert_equal('2017-11-11 00:00:00 UTC', "#{data_specific_d[:from]}")
    assert_equal('hourly', data_1day[:time_unit])
    assert_equal('daily', data_7days[:time_unit])
    assert_equal('daily', data_1month[:time_unit])
    assert_equal('monthly', data_1year[:time_unit])
    assert_equal('daily', data_specific_p[:time_unit])

  end

  test 'should get body of notification_log request' do
    device  = TblUserMfc.new
    features_printcount = FeaturesPrintconut
    features_consumable = FeaturesConsumable
    period = {from: Time.gm(2017, 12, 12),
              to: Time.gm(2017, 12, 20),
              time_unit: 'daily'
              }
    device_id = 'xxxxxxxxxxxx'
    req_printcount = device.body_notification(features_printcount, period, device_id)
    req_consumable = device.body_notification(features_consumable, period, device_id)
    assert_equal('xxxxxxxxxxxx', req_printcount[:device_id])
    assert_equal(FeaturesPrintconut, req_printcount[:features])
    assert_equal(FeaturesConsumable, req_consumable[:features])
    assert_equal("#{Time.gm(2017, 12, 12).strftime('%FT%H:%M:%S%:z')}", req_printcount[:from])
    assert_equal("#{Time.gm(2017, 12, 20).strftime('%FT%H:%M:%S%:z')}", req_printcount[:to])
    assert_equal('daily', req_printcount[:time_unit])
    assert_equal('True', req_printcount[:log_pre_from])
    assert_equal('True', req_consumable[:log_pre_from])
  end

  test 'should get body of online_log request' do
    device = TblUserMfc.new
    period = {
      from: Time.gm(2017, 12, 12),
      to: Time.gm(2017, 12, 20),
    }
    device_id = 'xxxxxxxxxxxx'
    body = device.body_network_status(period, device_id)
    assert_equal('xxxxxxxxxxxx', body[:device_id])
    assert_equal("#{Time.gm(2017, 12, 12).strftime('%FT%H:%M:%S%:z')}", body[:from])
    assert_equal("#{Time.gm(2017, 12, 20).strftime('%FT%H:%M:%S%:z')}", body[:to])
  end

  test 'should post API request' do
    device = TblUserMfc.new
    url = '/eu/devices/status/history'
    req_param = {
      "device_id": 'XXXXXXX',
      "from": "#{Time.gm(2017, 12, 12).strftime('%FT%H:%M:%S%:z')}",
      "to": "#{Time.gm(2017, 12, 20).strftime('%FT%H:%M:%S%:z')}"
    }
    assert_equal(400, device.api_request(url, req_param)["code"])
  end

  test 'should get features' do
    device = TblUserMfc.new
    assert_equal(FeaturesCommon + FeaturesConsumable, device.features('consumable'))
    assert_equal(FeaturesCommon + FeaturesPrintconut, device.features('printcount'))
  end

  test 'should get basic log' do
    device = tbl_user_mfcs(:foo_mfc)
    log_basic = device.get_log_basic
    assert_equal("Brother MFC-L8600CDW", log_basic[:model_name])
    assert_equal("Udfbb7669a3c67a", log_basic[:serial_number])
    assert_equal("001BA98A60B8", log_basic[:mac_address])
  end

  test 'should create csv format for basic log' do
    basic_log_1 = { model_name: "Brother MFC-L8600CDW",
      serial_number: "Udfbb7669a3c67a",
      mac_address: "001BA98A60B8"
    }
    csv_format_1 = create_csv_format_basic_log(basic_log_1)
    assert_equal("Brother MFC-L8600CDW", csv_format_1[0])
    assert_equal("Udfbb7669a3c67a", csv_format_1[1])
    assert_equal("001BA98A60B8", csv_format_1[2])

    basic_log_2 = { model_name: nil,
      serial_number: nil,
      mac_address: nil,
    }
    csv_format_2 = create_csv_format_basic_log(basic_log_2)
    assert_equal("-", csv_format_2[0])
    assert_equal("-", csv_format_2[1])
    assert_equal("-", csv_format_2[2])
  end
end
