class Carrie.Published.Hidden.Views.Exercise extends Backbone.Marionette.CompositeView
  template: 'published/hidden/exercises/show'
  tagName: 'article'
  itemView: Carrie.Published.Hidden.Views.Question
  itemViewContainer: 'div#exercise-hidden-questions'

  itemViewOptions: ->
    team_id: @options.team_id
    canAnswer: @options.canAnswer

  initialize: ->
    @collection = @model.get('questions')
    this

  onRender: ->
    Carrie.Helpers.MathJax.displayExpression(@el)
