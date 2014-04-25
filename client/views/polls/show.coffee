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

    r1 = randomText(shi1)
    r2 = randomText(shi1)

    $('#name').val(r1+r2)

randomText = (pool)->
  r = ''
  while(r == '' || r == ' ' || r == '，' || r == '。' || r == '∷ ')
    i = Math.floor(Math.random() * shi1.length)
    r = shi1[i]
    console.log r
  return r
