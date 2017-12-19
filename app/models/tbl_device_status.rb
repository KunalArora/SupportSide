class TblDeviceStatus < ApplicationRecord
  belongs_to :tbl_users, foreign_key: 'user_id', class_name: 'TblUser'
  belongs_to :tbl_user_mfcs, primary_key: 'device_id', foreign_key: 'device_id', class_name: 'TblUserMfc'

  OBJECT_ID = ['1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.10.0',
               '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.8.0',
               '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.11.0',
               '1.3.6.1.4.1.2435.2.3.9.4.2.1.5.5.20.0'].freeze

  def self.consumable_status id
    TblDeviceStatus.where(device_id: id, object_id: OBJECT_ID)
  end

  def self.maintenance_information device_id
    rawdata = get_maintenacne_information(device_id)
    if rawdata.nil?
      return empty = {}
    else
      if rawdata.status.present?
        @item = rawdata.get_item()
        item_renamed = rawdata.rename_item_key(@item)
        return item_renamed, rawdata.updated_date
      else
        return empty ={}
      end
    end
  end

  def self.get_maintenacne_information device_id
    TblDeviceStatus.find_by(device_id: device_id, object_id: '1.3.6.1.4.1.2435.2.4.3.2435.5.36.41.0')
  end

  def get_item
    item = Hash[*status.scan(/(.*=).*\"(.*)\"/).flatten]
  end

  def rename_item_key item
    item_renamed = {}
    Map77listItemRename.each do |category, names|
      item_renamed.store(category,{})
      item.each do |key, value|
        next unless names.has_key?(key)
        if names[key][:split]
          value = value.split(names[key][:split])
        end
        if names[key][:merge]
          value = merge_value(item, category, key, value)
        end
        if value.present?
          item_renamed[category].store(names[key][:label], value)
        end
      end
      item_renamed.delete(category) if item_renamed[category].empty?
    end
    return item_renamed
  end

  def merge_value item, category, key, value
    case category
    when "Print Count"
      merge_value_printcount(item, category, key, value)
    when "Toner/INK Replace Count"
      merge_value_tonerreplacecount(item, category, key, value)
    when "Drum Remaining Life", "BeltUnit Remaining Life", "FuserUnit Remaining Life", "LaserUnit Remaining Life", "PFKit Remaining Life"
      merge_value_remaininglife(item, category, key, value)
    when "Purge related"
      merge_value_purgerelated(item, category, key, value)
    end
  end

  def merge_value_printcount item, category, key, value
    printcount_dx = item.fetch(Map77listItemRename[category][key][:sublabel],"")
    printcount = value
    if printcount_dx.present?
      "#{printcount} (DX:#{printcount_dx})"
    else
      printcount
    end
  end

  def merge_value_tonerreplacecount item, category, key, value
    replacement_count = value
    item_value = item.fetch(Map77listItemRename[category][key][:sublabel][:manual],"")
    if item_value.present?
      replacement_count_manual = item_value
    else
      replacement_count_manual = "N/A"
    end
    item_value =  item.fetch(Map77listItemRename[category][key][:sublabel][:date],"")
    if item_value.present?
      replacement_date = item_value
    else
      replacement_date = "00/00/00"
    end
    "#{replacement_count} (#{replacement_count_manual}) #{replacement_date}"
  end

  def merge_value_remaininglife item, category, key, value
    remain = value
    remain_life_period = item.fetch(Map77listItemRename[category][key][:sublabel],"")
    if remain_life_period.present?
      "#{remain} (#{100*remain.to_i/remain_life_period.to_i}%)"
    end
  end

  def merge_value_purgerelated item, category, key, value
    purge_auto = value
    purge_manual = item.fetch(Map77listItemRename[category][key][:sublabel],"")
    if purge_manual.present?
      "#{purge_auto} (#{purge_manual})"
    end
  end

  def self.search_device_against_particular_object_id object_id
    TblDeviceStatus.where(object_id: object_id)
  end

  def self.retrieve_silent_devices silent_days
    TblDeviceStatus.select(:device_id)
      .merge(TblDeviceStatus.group(:device_id))
      .where(TblDeviceStatus.arel_table[:updated_date].lt (silent_days.to_i).days.ago)
      .where(device_id: TblUserMfc.retrieve_possible_silent_device_id(silent_days))
      .maximum(:updated_date)
  end

end
