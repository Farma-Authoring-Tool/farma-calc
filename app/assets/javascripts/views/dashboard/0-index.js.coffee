class Carrie.Views.DashboardIndex extends Backbone.Marionette.ItemView
  tagName: 'section'
  template: 'dashboard/index'

  initialize: ->
    @viewRequests = new Carrie.CompositeViews.ResquestLosToMe()
    @viewLastAnswers = new Carrie.CompositeViews.LastCommentsAnswers()

  onRender: ->
    $(@el).find('#requests-to-me').append(@viewRequests.el)
    # TODO: Change for experiment
    if $('body').data('control-group') == true
      $(@el).find('[data-hide="true"]').remove()
    else
      $(@el).find('#last-comments-answers').append(@viewLastAnswers.el)
    # ---
