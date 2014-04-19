@Students = new Meteor.Collection2 'students',
  schema:
    name:
      type: String
      label: 'Name'
      min: 2
    sex:
      type: String
      label: 'Sex'
      allowedValues: SEX

Students.helpers
  summary: ->
    return @name + '(' + @sex + ')'