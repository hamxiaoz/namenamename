# seed data: it'll run immediately when the server starts
Meteor.startup ->
  if Students.find().count() == 0
    console.log 'seeding data...'
    Students.insert
      name: 'Jack'
      sex: 'male'
    Students.insert
      name: 'Rose'
      sex: 'female'
