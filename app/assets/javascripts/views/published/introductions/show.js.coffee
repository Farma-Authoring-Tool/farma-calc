class Carrie.Published.Views.Introduction extends Backbone.Marionette.ItemView
  template: 'published/introductions/show'
  tagName: 'article'

  onRender: ->
    Carrie.Helpers.MathJax.displayExpression(@el)
    #MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el])
