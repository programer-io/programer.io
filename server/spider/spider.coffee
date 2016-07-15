
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
    console.log 'stderr: ' + err

  spider.on 'exit', (code) ->

    Fiber(->
      _.some JSON.parse(list), (item) ->
        result = Doc.findOne({title: item.title, site: item.site})
        if(result)
          console.log 'match...'
          return true
        else
          Doc.insert item
          console.log('data is inserted: ', item)
          return false
    ).run()

    console.log 'child process exited with code ' + code
