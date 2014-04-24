Template.showPoll.events
  'click #newCandidate': (e)->
    e.preventDefault()
    $('#modal').modal()

  'submit form': (e)->
    e.preventDefault()

    candidate =
      name: $('#name').val().trim()
      description: $('#description').val().trim()

    poll = this
    Meteor.call 'insertCandidate', poll._id, candidate

    $('#modal').modal('hide')

