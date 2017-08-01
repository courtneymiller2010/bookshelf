show_new_comment = (obj) ->
  $form = $(obj).closest('.comments').next('.add_new_comment').find('form')
  $form.removeClass('hide')
  $form.find('#comment_comment').focus()

cancel_comment = ->
  $form = $('.add_new_comment form#new_comment')
  $form.addClass('hide')
  $form.find('#comment_comment').val('')
  false

jQuery ->
  if $('.comments').length
    $('.comments').on 'click', '#add-new-comment', ->
      show_new_comment(this)

    $('.add_new_comment').on 'click', '.cancel_comment', ->
      cancel_comment