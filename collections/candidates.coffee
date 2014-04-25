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

if Meteor.isServer
  Meteor.methods
    randomCandidate: (count)->
      pinyin = Meteor.require("pinyin")

      result = []

      for i in [1..count]
        r = ''
        while r == ''
          index = Math.floor(Math.random() * shi1.length)
          r = shi1[index]
          console.log r
          if _.contains(INVALID_CHARACTERS, r) || !isPingTone(r)
            r = ''

        result.push r

      return result

  getTone = (char)->
    pinyin = Meteor.require("pinyin")
    py = pinyin char, {style: pinyin.STYLE_TONE2}
    console.log py[0][0]
    tone = parseInt py[0][0].slice(-1)
    console.log tone
    return tone

  isPingTone = (char)->
    tone = getTone char
    return tone == 0 || tone == 1



