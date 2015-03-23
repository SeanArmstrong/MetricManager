$(document).on "click", "tr[data-link]", ->
  console.log("delegated button click!")
  window.location = this.attributes.getNamedItem('data-link').value
