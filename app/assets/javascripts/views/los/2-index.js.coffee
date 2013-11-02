class Carrie.CompositeViews.Los extends Backbone.Marionette.CompositeView
  tagName: 'section'
  template: 'los/index'
  itemView: Carrie.Views.Lo

  events:
    'click #new_lo' : 'new_lo'

  new_lo: (ev) ->
    ev.preventDefault()
    Backbone.history.navigate('/my-los/new', true)

  onRender: ->
    @el.id = 'los'
