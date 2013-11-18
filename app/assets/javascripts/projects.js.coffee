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
        $(this).slideUp(400)
    else
      $('.highlight-div').each ->
        $(this).slideUp(400)
        console.log("Hiding all")
      $("#highlight-div-#{me.currentTarget.id}").slideDown(400)

  $(".project_title").fitText()
