if Meteor.isClient
  FlashMessages.configure
    autoHide: false
    autoScroll: true

# TODO should remove this on production
SimpleSchema.debug = true
