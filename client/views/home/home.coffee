Template.home.rendered = ->
  # SEO Page Title & Description
  document.title = "Name Name Name"
  $("<meta>", { name: "description", content: "Vote on names" }).appendTo "head"
