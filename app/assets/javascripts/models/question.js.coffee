class Carrie.Models.Question extends Backbone.RelationalModel
  urlRoot: ->
    '/api/los/' + @get('exercise').get('lo').get('id') + '/exercises/' + @get('exercise').get('id') + '/questions'

  paramRoot: 'question'

  relations: [{
    type: Backbone.HasMany
    key: 'tips'
    relatedModel: 'Carrie.Models.Tip'
    collectionType: 'Carrie.Collections.Tips'
    reverseRelation: {
      key: 'question'
    }
  },
  {
    type: Backbone.HasMany
    key: 'answers'
    relatedModel: 'Carrie.Models.Answer'
    collectionType: 'Carrie.Collections.Answers'
    reverseRelation: {
      key: 'question'
    }
  }
  ]

  defaults:
    'title': ''
    'content': ''
    'comparation_type': 'expression'
    'cmas_order': true
    'precision': 5
    'correct_feedback': ''
    'display_tips': ''

  toJSON: ->
    id: @get('id')
    title: @get('title')
    content: @get('content')
    correct_answer: @get('correct_answer')
    correct_feedback: @get('correct_feedback')
    available: @get('available')
    precision: @get('precision')
    cmas_order: @get('cmas_order')
    many_answers: @get('many_answers')
    display_tips: @get('display_tips')
    lo_id: @get('exercise').get('lo').get('id')
    exercise_id: @get('exercise').get('id')

Carrie.Models.Exercise.setup()
