jQuery ->
  $("#s3-uploader").S3Uploader()
  
  if $('#bookcase_show').length
    $('#bookcase_show').on 'click', '#add_picture', ->
      $('.upload_form').removeClass('hide')
      false