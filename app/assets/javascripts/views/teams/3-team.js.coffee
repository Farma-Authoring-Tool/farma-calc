class Carrie.Views.Team extends Backbone.Marionette.ItemView
  template: 'teams/team'
  tagName: 'article'

  events:
    'click .btn-enroll' : 'enroll'
    'keypress input': 'keyPressed'

  keyPressed: (ev) ->
    if (ev.keyCode == 13)
      ev.preventDefault()
      @enroll(ev)
      return false

  enroll: (ev) ->
    ev.preventDefault()
    form = $(@el).find('form')[0]
    $.ajax
      url: "/api/teams/#{form.id.value}/enroll"
      type: 'POST'
      data: {code: form.code.value}
      success: (data) =>
        #view = '<div class="alert alert-info">Matricula efetivada</div>'
        #$(@el).find('.enroll').html view
        Backbone.history.navigate("/teams/enrolled", true)
        Carrie.Helpers.Notifications.Top.success 'Matricula efetivada com sucesso!', 4000

      error: (data) ->
        resp = $.parseJSON(data.responseText)
        $(form).find('.error').html(resp.errors['enroll'])
