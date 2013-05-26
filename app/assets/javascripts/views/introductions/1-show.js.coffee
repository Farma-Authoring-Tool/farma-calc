class Carrie.Views.IntroductionShow extends Backbone.Marionette.ItemView
  template: 'introductions/show'
  tagName: 'article'
  className: 'header'

  events:
    'click #edit_intro' : 'edit'
    'click #destroy_intro' : 'destroy'
    'click #show_intro' : 'show'

  show: (ev) ->
    ev.preventDefault()
    $(@el).find('.intro-content').toggle('blind', {}, 500)

  edit: (ev) ->
    ev.preventDefault()
    id = @model.get('id')
    Backbone.history.navigate("/los/#{@model.get('lo').get('id')}/introductions/edit/#{id}", true)

  destroy: (ev) ->
    ev.preventDefault()
    msg = "Você tem certeza que deseja remover esta introdução?"

    bootbox.confirm msg, (confirmed) =>
      if confirmed
        @model.destroy
          success: (model, response) =>
            $(@el).fadeOut(800, 'linear')

            Carrie.Helpers.Notifications.Top.success 'Introdução removido com sucesso!', 4000

  onRender: ->
    @el.id = @model.get('id')
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el])
