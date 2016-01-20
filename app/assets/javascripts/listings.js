$(document).ready(function(){
  $('#listing-search').typeahead({
    name: "listing",
    displayKey: 'title',
    remote: "/listings/autocomplete?query=%QUERY"
  })

  $('.tt-hint').addClass('form-control')


});

