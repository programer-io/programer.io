
casper = require('casper').create
  clientScripts: ['node_modules/underscore/underscore-min.js']

url = 'http://www.freemoa.net/m4/s41?page=1'
casper.start url

result = ''
casper.then ->
  result = @evaluate ->
    projectList = $('#projectList li.sort-item')
    return _.map projectList, (project, idx) ->

      item = {}
      item.site  = 'freemoa'
      item.url   = 'http://www.freemoa.net/m4/s41?pno=' + $(project).find('.projectInfo').attr('data-pno')
      item.price = $(project).find('.expectation-pay').text()
      item.title = $(project).find('.projectInfo').text()
      item.desc  = $(project).find('.dec').text()
      item.tags  = _.map $(project).find('.projectTechs > span'), (tag) ->
        return $(tag).text()
      return item

casper.run ->
  @echo(JSON.stringify(result)).exit()
