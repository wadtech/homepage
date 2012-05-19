jQuery ->

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('.highlight_links').on 'click', '.highlight-link', (event) =>
    ShowOne(event)
    event.preventDefault()

  ShowOne = (me) =>
    if $("#highlight-div-#{me.currentTarget.id}").is (':visible')
      $('.highlight-div').each ->
        $(this).hide()
     else
      $('.highlight-div').each ->
        $(this).hide()
      $("#highlight-div-#{me.currentTarget.id}").show()