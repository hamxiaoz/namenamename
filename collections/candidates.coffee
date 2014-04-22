@Candidates = new Meteor.Collection2 'candidates',
  schema:
    name:
      type: String
      label: 'Name'
      min: 1
    meaning:
      type: String
      label: 'Meaning (optional)'
      optional: true

# Students.helpers
#   summary: ->
#     return @name + '(' + @sex + ')'

Meteor.methods
  newCandidate: (doc)->
    console.log doc

    # Important server-side check for security and data integrity
    check(doc, Schema.Candidates)

    Candidates.insert doc
