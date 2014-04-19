Meteor.publish 'students', () ->
  return Students.find()
