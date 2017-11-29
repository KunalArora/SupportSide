# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'click', 'td[data-href]', (evt) ->
    window.location = $(this).data('href')

$ ->
  $(document).on 'click', '#btn_submit', ->
    $('#frm').submit();

$ ->
  $('td.checkbox input[type="checkbox"]').click ->
    checked = (c for c in $("td.checkbox input[type=checkbox]") when $(c).prop("checked"))
    $("#btn_submit").attr({"disabled": (checked.length == 0)})

$ ->
  $(document).on 'click', '#all_check', ->
    checked = $('#all_check').prop("checked")
    $("#btn_submit").attr('disabled', !checked)
    $('td.checkbox input[type="checkbox"]').prop('checked', checked)
