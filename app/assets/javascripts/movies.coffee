#formatRepo = (repo) ->
#  if repo.loading
#    return repo.text
#  '<div class=\'select2-results-repository clearfix\'>' + '<div class=\'select2-result-repository__title\'>' + repo.Title + '</div></div>'
#
#formatRepoSelection = (repo) ->
#  repo.Title
#
#jQuery ->
#  # pre-select option
#  $('#movie_name option:first').attr('selected', 'true')
#
# Unfortunately, omdbapi has gone private, so this code no longer works
#  $('#movie_name').select2
#    theme: 'bootstrap'
#    ajax:
#      url: 'https://www.omdbapi.com/?'
#      dataType: 'json'
#      delay: 250
#      data: (params) ->
#        {
#          s: params.term
#        }
#      processResults: (data, params) ->
#        # parse the results into the format expected by Select2
#        # since we are using custom formatting functions we do not need to
#        # alter the remote JSON data, except to indicate that infinite
#        # scrolling can be used
#        params.page = params.page or 1
#        select2Data = $.map(data.Search, (obj) ->
#          obj.id = obj.Title
#          obj.text = obj.Title
#          obj
#        )
#        {
#          results: select2Data
#          pagination:
#            more: params.page * 30 < data.total_count
#        }
#      cache: true
#    escapeMarkup: (markup) ->
#      markup
#    minimumInputLength: 1
#    templateResult: formatRepo
#    templateSelection: formatRepoSelection
#
#  # Make Select2 display it correctly
#  # jsFiddle's seem to work fine
#  title = $('#movie_name option:selected').text()
#  $('#select2-movie_name-container').html(title)