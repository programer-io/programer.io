
@spider = (fileName) ->
  spawn = require('child_process').spawn
  Fiber = require('fibers')
  _     = require('underscore')

  spiderFile  = 'assets/app/' + fileName

  spider = spawn('casperjs', [spiderFile])

  # html controller

  list = ''
  spider.stdout.on 'data', (data) ->
    list += data

  spider.stderr.on 'data', (err) ->


  spider.on 'exit', (code) ->
    Fiber(->
      _.some JSON.parse(list), (item) ->
        result = Doc.findOne({title: item.title, site: item.site})
        if(result)
          return true
        else
          Doc.insert item
          return false
    ).run()

    console.log 'child process exited with code ' + code
