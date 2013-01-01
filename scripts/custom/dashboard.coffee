# Description:
#   A simple dashboard
#
# Dependencies:
#   ./utils/serve-html
#
# Configuration:
#   HUBOT_SOCKET_PORT
#
# Commands:
#   None
#
# URLS:
#   /

serveHTML = require './utils/serve-html'

viewsPath = __dirname + '/../../public/dashboard/views/'
fileName = 'dashboard'
templateOptions = { title: "MONOLITH LIVES", socketPort: process.env.HUBOT_SOCKET_PORT }

module.exports = (robot) ->

  robot.router.get '/', (req, res) ->
    serveHTML req, res, viewsPath, fileName, templateOptions

  robot.events.on 'pingd', (data) ->
    robot.socketServer.sockets.emit('pingd', data);

  robot.events.on 'visitor', (data) ->
    robot.socketServer.sockets.emit('visitor', data);