class Carrie.CompositeViews.ResquestLosToMe extends Backbone.Marionette.CompositeView
  tagName: 'section'
  itemView: Carrie.Views.RequestLoToMeItem

  initialize: ->
    requests = new Carrie.Collections.RequestLos
    requests.fetch url: '/api/requests/los/to-me'
    @collection = requests

  onRender: ->
    if @collection.length == 0
      text = "<p>Você não possui solicitações pendentes</p>"
      $(@el).append(text)
