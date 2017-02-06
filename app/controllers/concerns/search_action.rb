module SearchAction
  extend ActiveSupport::Concern

  CUSTOMER_UUID_REGEXP = /\A\{([[:alnum:]]{8}-(?:[[:alnum:]]{4}-){3}[[:alnum:]]{12})\}\Z/i
  DEVICE_ID_REGEXP = /\A([[:alnum:]]{8}-(?:[[:alnum:]]{4}-){3}[[:alnum:]]{12})\Z/i
  SERIAL_NUMBER_REGEXP = /\A[[:alnum:]]{9}\Z/i, /\A[[:alnum:]]{15}\Z/i
  # rubocop:enable Metrics/LineLength

  def redirect_path query
    case query
    when DEVICE_ID_REGEXP
      devices_search_path(device_id: query)
    when CUSTOMER_UUID_REGEXP
      customers_path("{#{Regexp.last_match(1)}}")
    when *SERIAL_NUMBER_REGEXP
      devices_search_path(serial: query)
    end
  end
end
