class Carrie.Published.Models.Lo extends Backbone.RelationalModel
  urlRoot: '/api/published/los/'

  paramRoot: 'lo'

  relations: [{
    type: Backbone.HasMany
    key: 'introductions'
    relatedModel: 'Carrie.Published.Models.Introduction'
    collectionType: 'Carrie.Published.Collections.Introductions'
    reverseRelation: {
      key: 'lo'
    }
  },
  {
    type: Backbone.HasMany
    key: 'exercises'
    relatedModel: 'Carrie.Published.Models.Exercise'
    collectionType: 'Carrie.Published.Collections.Exercises'
    reverseRelation: {
      key: 'lo'
    }
  }
  ]

Carrie.Models.Lo.setup()
