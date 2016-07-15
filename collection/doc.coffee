@Doc = new Meteor.Collection('doc')


if Meteor.isServer
  Meteor.publish 'projects', ->
    return Doc.find({}, {sort: {date: -1}})


  Doc.allow
    insert: -> return true
    update: -> return true
    remove: -> return false
