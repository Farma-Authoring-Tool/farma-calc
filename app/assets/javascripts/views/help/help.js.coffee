class Carrie.Views.Help extends Backbone.Marionette.ItemView
  template: 'help/help'
  tagName: 'section'
  className: 'help'

  onRender: ->
    Carrie.Helpers.MathJax.displayExpression(@el)
    #MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el])
