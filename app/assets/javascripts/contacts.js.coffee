jQuery ->
  $('.message_archive').click (event) ->
    $target = $(event.target)
    $row = $target.parents("tr")