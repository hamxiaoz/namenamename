Meteor.publish 'polls', () ->
  return Polls.find()

Meteor.publish 'poll', (id) ->
  return id && Polls.find(id)

