

whichByKeyup = 0

Template.createPost.events

  'keydown #post-create-textarea': (e, t) ->
    whichByKeyup = e.which
    console.log 'whichByKeyup', whichByKeyup

  'keyup #post-create-textarea': (e, t) ->
    e.preventDefault()

    if e.which == 16 && whichByKeyup == 13
      post =
        project: FlowRouter.getParam('id')
        type: 'POST'
        owner: Meteor.user()
        text: $('#post-create-textarea').val()
        date: new Date()


      $('#post-create-textarea').val('')
      Post.insert(post)

    text = $('#post-create-textarea').val()
    if(text)
      $('#postCreateBtn').removeAttr('disabled')
    else
      $('#postCreateBtn').attr('disabled', 'disabled')

    e.target.style.height = "1px"
    e.target.style.height = (20 + e.target.scrollHeight)+"px"

  'click #postCreateBtn': (e, t) ->
    e.preventDefault();
    post =
      project: FlowRouter.getParam('id')
      type: 'POST'
      owner: Meteor.user()
      text: $('#post-create-textarea').val()
      date: new Date()

    $('#post-create-textarea').val('')
    Post.insert(post)
