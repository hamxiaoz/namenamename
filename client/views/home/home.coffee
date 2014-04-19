Template.home.rendered = ->
  # SEO Page Title & Description
  document.title = "New App"
  $("<meta>", { name: "description", content: "Awesome Meteor App" }).appendTo "head"
