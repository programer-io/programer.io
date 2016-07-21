
Meteor.startup ->
  @spiders = ->
    spider('wishket.coffee')
    spider('freemoa.coffee')

  ########################################################
  # spider_wishket
  ########################################################
  SyncedCron.add
    name: 'spiders'
    schedule: (parser) ->
      return parser.text('every 10 minutes')
    job: spiders

  SyncedCron.start()
  ########################################################
