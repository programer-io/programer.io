########################################
# init
########################################

@width = new ReactiveVar(null);


########################################
# template
########################################
Template.project.onCreated ->
  @subscribe('projects');
  @subscribe('posts', FlowRouter.getParam('id'));

Template.project.onRendered ->
  $(window).resize ->
    width.set($(window).width())

Template.project.helpers
  isMobileSize: ->
    if !width.get()
      width.set(window.innerWidth || document.body.clientWidth)
    return width.get() < 900

  project: ->
    return Doc.findOne(FlowRouter.getParam 'id')

  posts: ->
    return Post.find({project: FlowRouter.getParam('id')}, {sort: {date: -1}})

  date: ->
    return moment(@createdAt).format('YYYY-MM-DD HH:mm:ss')

Template.project.events {}
