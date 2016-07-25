########################################
# init
########################################

@width = new ReactiveVar(null);


########################################
# template
########################################
Template.main.onCreated ->
  log('main.onCreated')
  @subscribe('projects')
  @subscribe('postAll')

Template.main.onRendered ->
  $(window).resize ->
    width.set($(window).width())

Template.main.helpers
  isMobileSize: ->
    if !width.get()
      width.set(window.innerWidth || document.body.clientWidth)
    return width.get() < 900

  projects: ->
    return Doc.find({}, {sort: {date: -1}})

  postCount: (id)->
    return Post.find({project: id}).count()

Template.main.events {}
