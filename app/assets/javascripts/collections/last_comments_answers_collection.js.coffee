class Carrie.Collections.LastCommentsAnswers extends Backbone.Collection
  model: Backbone.Model
  url: '/api/last_comments_answers'
  
  initialize: ->
    Carrie.Utils.Loading @
