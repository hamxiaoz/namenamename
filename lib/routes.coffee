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
      return [Meteor.subscribe('students')]
    data: ->
      if @ready()
        return {
          students: Students.find {}, {sort:{name:1}}
        }

## router hooks
Router.onBeforeAction(()-> FlashMessages.clear();)
Router.onBeforeAction('loading')

