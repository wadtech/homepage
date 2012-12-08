jQuery ->
  $('.message_archive').click (event) ->
    target = event.target
    row = target.parent("tr")
    row.hide(1000)