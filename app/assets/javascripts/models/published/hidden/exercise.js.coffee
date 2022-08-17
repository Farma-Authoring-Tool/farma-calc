class Carrie.Published.Hidden.Models.Exercise extends Backbone.RelationalModel
  urlRoot: "/api/published/exercises"

  relations: [{
    type: Backbone.HasMany
    key: 'questions'
    relatedModel: 'Carrie.Published.Hidden.Models.Question'
    collectionType: 'Carrie.Published.Hidden.Collections.Questions'
    reverseRelation: {
      key: 'exercise_p'
    }
  }]
