
casper = require('casper').create
  clientScripts: ['node_modules/underscore/underscore-min.js']

url = 'https://www.wishket.com/project/'
casper.start url

result = ''
casper.then ->
  result = @evaluate ->
    projectList = $('.project-unit')
    return _.map projectList, (project, idx) ->

      item = {}
      item.site  = 'wishket'
      item.url   = 'https://www.wishket.com' + $(project).find('.project-title > a').attr('href')
      item.price = $(project).find('.project-unit-basic-info span:nth-child(1)').text()
      item.title = $(project).find('.project-title').text()
      item.desc  = $(project).find('.project-unit-desc').text()
      item.tags  = _.map $(project).find('.project-skill'), (tag) ->
        return $(tag).text()
      return item

casper.run ->
  @echo(JSON.stringify(result)).exit()
