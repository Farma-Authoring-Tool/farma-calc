class Carrie.CompositeViews.LastCommentsAnswers extends Backbone.Marionette.CompositeView
  template: null 
  itemView: Carrie.Views.LastCommentsAnswersItem

  initialize: ->
    @collection = new Carrie.Collections.LastCommentsAnswers()

    @collection.fetch success: (collection) =>
      if collection.length > 0
        @template = 'dashboard/last_comments_answers_table'
        @itemViewContainer = 'tbody'
        @render()
      else
        @template = 'dashboard/last_comments_answers_empty'
        @render()

  onRender: ->
    $(@el).find('th[data-toggle="tooltip"]').tooltip()
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el])
