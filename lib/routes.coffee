Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'not_found'
  before: ->
    $('meta[name^="description"]').remove()

Router.map ()->
  @route 'home',
    path: '/'
    yieldTemplates:
      'jumbotron': {to: 'beforeContainer'}
    waitOn: () ->
      return [Meteor.subscribe('polls')]
    data: ->
      if @ready()
        return Polls.find {}, {sort:{name:1}}

  @route 'showPoll',
    path: '/polls/:_id'
    waitOn: () ->
      return [Meteor.subscribe('poll', @params._id)]
    data: ->
      if @ready()
        return Polls.findOne @params._id

  @route 'newCandidate',
    path: '/candidates/new'

## router hooks
Router.onBeforeAction(()-> FlashMessages.clear();)
Router.onBeforeAction('loading')

