class Carrie.Views.ExerciseItem extends Backbone.Marionette.ItemView
  template: 'exercises/exercise'
  tagName: 'article'

  onRender: ->
    @el.id = @model.get('id')
    $(@el).find('span.icon i').tooltip()

  events:
    'click #show_exer' : 'show'
    'click #edit_exer' : 'edit'
    'click #destroy_exer' : 'destroy'

  show: (ev) ->
    ev.preventDefault()
    Backbone.history.navigate('/los/'+@model.get('lo').get('id')+'/exercises/'+@el.id, true)

  edit: (ev) ->
    ev.preventDefault()
    Backbone.history.navigate('/los/'+@model.get('lo').get('id')+'/exercises/edit/'+@el.id, true)

  destroy: (ev) ->
    ev.preventDefault()
    intro = Carrie.Models.Exercise.findOrCreate
      id: @el.id

    msg = "Você tem certeza que deseja remover esta introdução?"

    bootbox.confirm msg, (confirmed) ->
      if confirmed
        intro.destroy
          wait: true
          success: (model, response) ->
            $('#'+model.get('id')).fadeOut(800, 'linear')

            Carrie.Utils.Alert.success('Exercício removido com sucesso!', 2500)
