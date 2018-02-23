require 'csv'
require 'mib_parser'
require 'odessa_api'
class TblUserMfc < ApplicationRecord
  include CsvUtility
  belongs_to :tbl_mfc_model, foreign_key: 'id_model', class_name: 'TblMfcModel'
  belongs_to :tbl_user, foreign_key: 'id_user', class_name: 'TblUser'
  has_one :tlb_serial_mfc, foreign_key: 'id_mfc'
  has_many :tbl_device_statuses, primary_key: 'device_id', foreign_key: 'device_id', class_name: 'TblDeviceStatus'
  has_many :tbl_subscription_configs, primary_key: 'device_id', foreign_key: 'device_id', class_name: 'TblSubscriptionConfig'

  OMNIPRESENT_OBJECT_ID = '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0'

  scope :includes_device_status_information, lambda {
    joins(:tbl_user, :tbl_mfc_model, :tbl_device_statuses).references(:tbl_user, :tbl_mfc_model, :tbl_device_statuses)
  }

  scope :includes_device_information, lambda {
    joins(:tbl_user, :tbl_mfc_model).references(:tbl_user, :tbl_mfc_model)
  }

  scope :search_with_query, lambda { |key, value|
    case key
    when 'device_id'
      where('tbl_user_mfcs.device_id=? AND tbl_user_mfcs.status!=?', "#{value}", '-1')
    when 'serial'
      if value.size == 9
        where('serial LIKE ? AND tbl_user_mfcs.status!=?', "%#{value}", '-1')
      else
        where('tbl_user_mfcs.serial=? AND tbl_user_mfcs.status!=?', "#{value}", '-1')
      end
    end
  }

  scope :search_for_devices, lambda { |device_ids|
    where(device_id: device_ids).order('tbl_device_statuses.updated_date DESC').distinct
  }

  def self.device_info key, value
    includes_device_information.search_with_query(key, value)
  end

  def self.retrieve_possible_silent_device_id silent_days
     TblUserMfc.joins(:tbl_subscription_configs, :tbl_device_statuses)
      .merge(TblSubscriptionConfig.search_device_against_particular_object_id(OMNIPRESENT_OBJECT_ID))
      .merge(TblDeviceStatus.search_device_against_particular_object_id(OMNIPRESENT_OBJECT_ID))
      .where(TblDeviceStatus.arel_table[:updated_date].lt (silent_days.to_i).days.ago)
      .where(online: 1).distinct(:device_id).pluck(:device_id)
  end

  def self.silent_device silent_days
    device_ids = TblDeviceStatus.retrieve_silent_devices(silent_days)

    result = includes_device_status_information.search_for_devices(device_ids.keys)
    return result, device_ids
  end

  def get_connection_type
    unless name.nil?
      if name.index('USB')
        "BOAgent(USB)"
      elsif name.index('NW')
        "BOAgent(Network)"
      else
        "BOC direct"
      end
    end
  end

  def get_since
    DateTime.strptime(last_presence[0..9].to_i.to_s, '%s').strftime('%d/%m/%Y %H:%M:%S')
  end

  def get_online_status
    if online
      'Online'
    else
      'Offline'
    end
  end

  def get_offline_days
    if !online
      t = Time.at(last_presence[0..9].to_i).utc
      (Date.today - Date.new(t.year, t.month, t.day)).to_i
    else
      0
    end
  end

  def latest_status_updated_date
  date = tbl_device_statuses.to_a.map{|item| item.updated_date.to_i}.max
  unless date.nil?
    Time.at(date).utc.strftime('%d/%m/%Y %H:%M:%S')
  end
end


  def get_warning
    'Not subscribed' if tbl_subscription_configs.empty?
  end

  def self.get_device_information_csv user_uuid, check_box
    device_informations = TblUserMfc.includes(:tbl_mfc_model, :tbl_device_statuses, :tbl_subscription_configs)
                        .joins(:tbl_user)
                        .where(tbl_users: {uid: user_uuid})
    unless check_box.nil?
      device_informations = device_informations.where(device_id: check_box[:device_id]).order(:id)
    end
    CSV.generate do |csv|
      csv << CsvColumns
      device_informations.each do |d|
        data_parsed = {}
        MibParseKey.each do |k, v|
          values ={}
          mib_object = MIBParser::ObjectId.new(k)
          if mib_object.respond_to?(:pair_oid)
            values_key ={}
            index_num = v.size
            index_num.times.each do |i|
              device_status_key = d.tbl_device_statuses.select{ |item|
                                                  item.object_id == "#{k}.#{i}"
                                                 }[0]
              device_status = d.tbl_device_statuses.select{ |item|
                                                  item.object_id == "#{mib_object.pair_oid}.#{i}"
                                                 }[0]
              unless device_status.nil?
                status_key = MIBParser::ObjectId.new("#{k}.#{i}").parse(device_status_key.status)
                status_value = MIBParser::ObjectId.new("#{mib_object.pair_oid}.#{i}").parse(device_status.status)
              end
              data_parsed[status_key] = status_value
            end
          else
            device_status = d.tbl_device_statuses.select{ |item|
                                                  item.object_id == k.to_s
                                                 }[0]
            unless device_status.nil?
              values = mib_object.parse(device_status.status)
            end
            v.each do |name|
              data_parsed[name] = values[name]
            end
          end
        end
        csv << [d.device_id,
                d.latest_status_updated_date,
                d.tbl_mfc_model.name,
                d.serial,
                data_parsed['Mac_Address'],
                d.get_connection_type,
                d.get_warning,
                d.get_online_status,
                d.get_since,
                d.get_offline_days,
                data_parsed['Location'],
                data_parsed['Contact'],
                data_parsed['Total_Page_Count'],
                data_parsed['Monochrome_Page_Count'],
                data_parsed['Color_Page_Count'],
                data_parsed['TonerInk_Black'],
                data_parsed['TonerInk_Cyan'],
                data_parsed['TonerInk_Magenta'],
                data_parsed['TonerInk_Yellow'],
                data_parsed['Drum_Unit'],
                data_parsed['Drum_Unit_Black'],
                data_parsed['Drum_Unit_Cyan'],
                data_parsed['Drum_Unit_Magenta'],
                data_parsed['Drum_Unit_Yellow'],
                data_parsed['PFKit1_Status'],
                data_parsed['PFKit2_Status'],
                data_parsed['PFKit3_Status'],
                data_parsed['PFKit4_Status'],
                data_parsed['PFKit5_Status'],
                data_parsed['PFKitMP_Status'],
                data_parsed['FuserUnit_Status'],
                data_parsed['LaserUnit_Status'],
                data_parsed['Belt_Unit'],
                data_parsed['Waste_TonerPack'],
                data_parsed['TonerInk_LifeBlack'],
                data_parsed['TonerInk_LifeCyan'],
                data_parsed['TonerInk_LifeMagenta'],
                data_parsed['TonerInk_LifeYellow'],
                data_parsed['Drum_Count'],
                data_parsed['Drum_Count_Black'],
                data_parsed['Drum_Count_Cyan'],
                data_parsed['Drum_Count_Magenta'],
                data_parsed['Drum_Count_Yellow'],
                data_parsed['Drum_Unit_Remaining_Life'],
                data_parsed['Drum_Unit_Black_Remaining_Life'],
                data_parsed['Drum_Unit_Cyan_Remaining_Life'],
                data_parsed['Drum_Unit_Magenta_Remaining_Life'],
                data_parsed['Drum_Unit_Yellow_Remaining_Life'],
                data_parsed['Paper_Feeding_Kit_1_Remaining_Life'],
                data_parsed['Paper_Feeding_Kit_2_Remaining_Life'],
                data_parsed['Paper_Feeding_Kit_3_Remaining_Life'],
                data_parsed['Paper_Feeding_Kit_4_Remaining_Life'],
                data_parsed['Paper_Feeding_Kit_5_Remaining_Life'],
                data_parsed['Paper_Feeding_Kit_MP_Remaining_Life'],
                data_parsed['Fuser_Unit_Remaining_Life'],
                data_parsed['Laser_Unit_Remaining_Life'],
                data_parsed['Belt_Unit_Remaining_Life'],
                data_parsed['TonerInk_Black_Replace_Count'],
                data_parsed['TonerInk_Cyan_Replace_Count'],
                data_parsed['TonerInk_Magenta_Replace_Count'],
                data_parsed['TonerInk_Yellow_Replace_Count'],
                data_parsed['Drum_Unit_Replace_Count'],
                data_parsed['Drum_Unit_Black_Replace_Count'],
                data_parsed['Drum_Unit_Cyan_Replace_Count'],
                data_parsed['Drum_Unit_Magenta_Replace_Count'],
                data_parsed['Drum_Unit_Yellow_Replace_Count'],
                data_parsed['Paper_Feeding_Kit_1_Replace_Count'],
                data_parsed['Paper_Feeding_Kit_2_Replace_Count'],
                data_parsed['Paper_Feeding_Kit_3_Replace_Count'],
                data_parsed['Paper_Feeding_Kit_4_Replace_Count'],
                data_parsed['Paper_Feeding_Kit_5_Replace_Count'],
                data_parsed['Paper_Feeding_Kit_MP_Replace_Count'],
                data_parsed['Fuser_Unit_Replace_Count'],
                data_parsed['Laser_Unit_Replace_Count'],
                data_parsed['Belt_Unit_Replace_Count'],
                data_parsed['Waste_Toner_Box_Replace_Count'],
                data_parsed['Print_Page_SxDx_Count_A4Letter'],
                data_parsed['Print_Mono_Page_SxDx_Count_A4Letter'],
                data_parsed['Print_Color_Page_SxDx_Count_A4Letter'],
                data_parsed['Print_Page_SxDx_Count_A5B5'],
                data_parsed['Print_Mono_Page_SxDx_Count_A5B5'],
                data_parsed['Print_Color_Page_SxDx_Count_A5B5'],
                data_parsed['Print_Page_SxDx_Count_LegalB4'],
                data_parsed['Print_Mono_Page_SxDx_Count_LegalB4'],
                data_parsed['Print_Color_Page_SxDx_Count_LegalB4'],
                data_parsed['Print_Page_SxDx_Count_A3Ledger'],
                data_parsed['Print_Mono_Page_SxDx_Count_A3Ledger'],
                data_parsed['Print_Color_Page_SxDx_Count_A3Ledger'],
                data_parsed['Print_Page_SxDx_Count_4x6Postcard'],
                data_parsed['Print_Mono_Page_SxDx_Count_4x6Postcard'],
                data_parsed['Print_Color_Page_SxDx_Count_4x6Postcard'],
                data_parsed['Print_Page_SxDx_Count_Other'],
                data_parsed['Print_Mono_Page_SxDx_Count_Other'],
                data_parsed['Print_Color_Page_SxDx_Count_Other'],
                data_parsed['Black_Coverage'],
                data_parsed['Cyan_Coverage'],
                data_parsed['Magenta_Coverage'],
                data_parsed['Yellow_Coverage'],
                data_parsed['USTATUS'],
                ]
      end
    end
  end

  def get_notification_log params, device_id
    f = features(params[:reporting_item])
    p = period(params)
    req_body = body_notification(f, p, device_id)
    res = api_request('/eu/devices/log/history', req_body)
    dl_judge = res['data'].select {|item| item['error_code'] == 200}
    return unless dl_judge.present?
    csv_format_notification_log = create_csv_format_notification_log(date_list(res["data"]), res["data"], f)
    return to_csv(FeaturesBasic + f, csv_format_notification_log, create_csv_format_basic_log(get_log_basic), device_id, create_csv_format_log_type(params[:reporting_item]), p)
  end

  def get_network_status_log params, device_id
    p = period(params)
    req_body_network_status = body_network_status(p, device_id)
    req_body_notification = body_notification(FeaturesCommon, p, device_id)
    network_status = api_request('/eu/devices/status/history', req_body_network_status)
    notification = api_request('/eu/devices/log/history', req_body_notification)
    return unless network_status["data"].present?
    list = date_list([network_status["data"]])
    csv_format_notification_log = create_csv_format_notification_log(list, notification["data"], FeaturesCommon)
    csv_format_network_status_log = create_csv_format_network_status_log(list, network_status["data"])
    csv_format = Hash.new
    csv_format_network_status_log.each_key do |key|
      csv_format.store(key, csv_format_notification_log[key] + csv_format_network_status_log[key])
    end
    return to_csv(FeaturesBasic + FeaturesCommon + ["Online_Offline"], csv_format, create_csv_format_basic_log(get_log_basic), device_id, ["Network Status"], p)
  end

  def api_request url, req_param
    req = Net::HTTP::Post.new(url)
    req.body = req_param.to_json
    JSON.parse(OdessaAPI.new(Rails.application.config.odessa_api_endpoint).connect(req))
  end

  def features reporting_item
    case reporting_item
    when 'consumable'
      FeaturesCommon + FeaturesConsumable
    when 'printcount'
      FeaturesCommon + FeaturesPrintconut
    end
  end

  def period params
    to = Time.current.utc
    case params[:period]
    when 'last_1_day'
      from = to.yesterday
      time_unit = 'hourly'
    when 'last_7_days'
      from = to.ago(7.days)
      time_unit = 'daily'
    when 'last_1_month'
      from = to.prev_month
      time_unit = 'daily'
    when 'last_1_year'
      from = to.prev_year
      time_unit = 'monthly'
    when 'specific_period'
      from = text_to_time(params[:from])
      to = text_to_time(params[:to])+ (60 * 60 * 24) - 1
      time_unit = params[:time_unit]
    when 'specific_date'
      from = text_to_time(params[:date])
      to = from + (60 * 60 * 24) - 1
      time_unit = 'hourly'
    end
    {to: to,
     from: from,
     time_unit: time_unit
    }
  end

  def text_to_time text
    array = text.split('/')
    Time.utc(array[2], array[1], array[0])
  end

  def body_notification features, period, device_id
    { "device_id": device_id,
      "features": features,
      "from": "#{period[:from].strftime('%FT%H:%M:%S%:z')}",
      "to": "#{period[:to].strftime('%FT%H:%M:%S%:z')}",
      "time_unit": "#{period[:time_unit]}",
      "log_pre_from": "True"
    }
  end

  def body_network_status period, device_id
    { "device_id": device_id,
      "from": "#{period[:from].strftime('%FT%H:%M:%S%:z')}",
      "to": "#{period[:to].strftime('%FT%H:%M:%S%:z')}"
    }
  end

  def get_log_basic
    mac_address = tbl_device_statuses.select {|item|
      item.object_id == '1.3.6.1.2.1.2.2.1.6.1'
    }.map(&:status)[0]
    if mac_address.present?
      mac_address_parsed = MIBParser::ObjectId.new('1.3.6.1.2.1.2.2.1.6.1').parse(mac_address)["Mac_Address"]
    end
    { model_name: tbl_mfc_model.name,
      serial_number: serial,
      mac_address: mac_address_parsed,
    }
  end
end
