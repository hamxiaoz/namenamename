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

  'click #random': (e)->
    e.preventDefault()

    Meteor.call 'randomCandidate', 2, (error, result)->
      console.log error
      console.log result
      $('#name').val(result[0]+result[1])
