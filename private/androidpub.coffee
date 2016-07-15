
casper = require('casper').create
  clientScripts: [
    'packages/jquery.js',
    'node_modules/underscore/underscore-min.js'
  ]


url = 'http://www.androidpub.com/index.php?mid=promotion&category=957287&m=1'

detailUrl = ''
result    = []
title     = ''
casper.start url

casper.then ->
  @mouse.click('body > div.bd > ul > li:nth-child(2) > a')
  title = @evaluate ->
    return document.querySelector('body > div.bd > ul > li:nth-child(2) > a > span.title > strong').innerText

casper.waitForSelector 'div.bd > div.co > div', ->
  result = @evaluate ->
    item = {}
    item.site   = 'androidpub'
    item.title  = (document.querySelector('body > div.bd > div.hx.h2 > h2').innerText).substring(33)
    item.desc   = document.querySelector('body > div.bd > div.co > div').innerText
    item.date   = new Date()

    return [item]

# casper.then ->


casper.run ->
  result[0].url = @getCurrentUrl()
  @echo(JSON.stringify(result)).exit()
