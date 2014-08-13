class Carrie.Views.LastCommentsAnswersItem extends Backbone.Marionette.ItemView
  template: 'dashboard/last_comments_answer_row'
  tagName: 'tr'
  className: 'answers-link'

  events:
    'click' : 'retro'

  retro: (ev) ->
    ev.preventDefault()
    Carrie.Helpers.Retroaction.open @model.get('id'), =>
      # update list of answers and comments
      @model.collection.fetch()
