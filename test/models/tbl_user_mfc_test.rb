require 'test_helper'
require 'csv'
class TblUserMfcTest < ActiveSupport::TestCase

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
end
