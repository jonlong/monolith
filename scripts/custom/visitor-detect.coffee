# Description:
#   Visitor Detect
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# URLS:
#   /hubot/dashboard

fs = require('fs')
jade = require('jade')
io = require('socket.io')
url = require('url')

viewsPath = __dirname + '/public/dashboard/views/'
indexFileName = 'visitor'

module.exports = (robot) ->

  robot.router.get "/hubot/visitor", (req, res) ->
    viewPath = viewsPath + indexFileName + '.jade'
    queryObject = url.parse(req.url,true).query
    console.log queryObject
    try
      fs.realpathSync viewPath
    catch e
      res.writeHead 404
      res.end

    fs.readFile viewPath, (err, data) ->
      if err
        console.log err
        res.writeHead 500
        res.end
        return
    
      fn = jade.compile data
      html = fn { title: "Hi, "+queryObject.visitor+"!", visitor: queryObject.visitor.charAt(0).toUpperCase() + queryObject.visitor.slice(1) }

      res.writeHead 200, {"Content-Type": "text/html"}
      res.end html

      robot.events.emit 'visitor', {
        visitor: queryObject.visitor
        message: 'Dave, '+queryObject.visitor.charAt(0).toUpperCase() + queryObject.visitor.slice(1)+' just visited'
      }