# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'click', '#radio_submit_notificaiton', ->
    $('.error').hide()
    if $('#specific_p').prop("checked")
      times = [$('#from').val(), $('#to').val()]
      date_validation times, '#frm_notification', '.notification_log'
    else
      $('#frm_notification').submit()

$ ->
  $(document).on 'click', '#radio_submit_online', ->
    $('.error').hide()
    if $('#specific_d').prop("checked")
      times = [$('#text_d').val()]
      date_validation times,'#frm_online', '.online_status_log'
    else
      $('#frm_online').submit()

date_validation  = (array_date, id, category) ->
  flag = 0
  index = 0
  for elem in array_date
    if !elem.match(/^\d{1,2}\/\d{1,2}\/\d{4}$/)
      $(category).append("<div class='error'>Date has incorrect format.</div>")
      return false
    time = elem.match(/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/)
    year = time[3] - 0
    month = time[2] - 1
    day = time[1] - 0
    if month >= 0 && month <=11 && day >=1 && day <= 31
      date = new Date(year, month, day)
      if date.getFullYear() is year && date.getMonth() is month && date.getDate() is day
        if index is 0
          if date > new Date
            $(category).append("<div class='error'>Date is incorrect. Please input a date earlier than today.</div>")
            return false
        flag += 1
        index += 1
        if flag is array_date.length
          $(id).submit()
      else
        $(category).append("<div class='error'>Date does not exist. Please input correct date.</div>")
        return false
    else
      $(category).append("<div class='error'>Date does not exist. Please input correct date.</div>")
      return false

$ ->
  $(document).on 'click', '.period input[type=radio]', ->
    checked = $('#specific_p').prop("checked")
    $('.notification_log input[type=text]').attr('disabled', !checked)
    $('.time_unit input[type=radio]').attr('disabled', !checked)

$ ->
  $(document).on 'click', '.online_status_log input[type=radio]', ->
    checked = $('#specific_d').prop("checked")
    $('.online_status_log input[type=text]').attr('disabled', !checked)
