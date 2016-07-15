
########################################
# redirect
########################################
FlowRouter.route '/',           {action: -> FlowRouter.go 'main'}
FlowRouter.route '/index.html', {action: -> FlowRouter.go 'main'}
FlowRouter.route '/index.htm',  {action: -> FlowRouter.go 'main'}



FlowRouter.route '/main',
  name: 'main'
  action: -> BlazeLayout.render 'mainLayout', {content: 'main'}
