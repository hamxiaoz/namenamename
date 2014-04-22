# seed data: it'll run immediately when the server starts
Meteor.startup ->
  if Polls.find().count() == 0
    id = Polls.insert
          familyName: '郑'
          sex: 'female'
          description: '两个字三个字都可以'
    console.log 'seeding data...'
    Meteor.call 'insertCandidate', id, {name: 'Rose', description: 'Titanic'}
    Meteor.call 'insertCandidate', id, {name: 'White', description: 'Snow White'}
