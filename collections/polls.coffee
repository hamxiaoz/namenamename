@Polls = new Meteor.Collection2 'polls',
  schema:
    familyName:
      type: String
      label: 'Family Name'
      min: 1
    sex:
      type: String
      label: 'Sex'
      allowedValues: SEX
    description:
      type: String
      label: 'Description'
    candidates:
      type: [Object]
      optional: true
    'candidates.$.name':
      type: String
    'candidates.$.description':
      type: String
      optional: true

# Students.helpers
#   summary: ->
#     return @name + '(' + @sex + ')'

Meteor.methods
  newPoll: (doc)->
    # Important server-side check for security and data integrity
    check(doc, Schema.Candidates)

    Polls.insert doc

  insertCandidate: (id, candidate)->
    Polls.update {_id:id}, {$addToSet: {candidates: candidate}}

