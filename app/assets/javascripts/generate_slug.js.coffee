(($) ->
  class GenerateSlug
    constructor: (@element, @options) ->
      @bindDomEvents()
    bindDomEvents: ->
      @element.on "click", (event) =>
        event.preventDefault()
        @updateTrans()
    updateTrans: ->
      $.ajax
        data: { name: @options.$fieldVal.val() }
        type: 'get'
        url:  @element.attr('href')
        dataType: "json"

        success: (response) =>
          @options.$slugField.val response.slug

  $.fn.generateSlug = (options) ->
    @each ->
      $this = $(this)
      $this.data "generateSlug", new GenerateSlug($this, options)  unless $this.data("generateSlug")

) jQuery
