@Post = new Meteor.Collection('post')


if Meteor.isServer
  Meteor.publish 'postAll', ->
    return Post.find({}, {sort: {date: -1}})

  Meteor.publish 'posts', (id)->
    return Post.find({project: id}, {sort: {date: -1}})

  Post.allow
    insert: -> return true
    update: -> return true
    remove: -> return false
