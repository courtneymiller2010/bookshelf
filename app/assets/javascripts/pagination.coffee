jQuery ->
  $('.pagination').on 'click', 'a', ->
    $.getScript(this.href)
    false