# Description:
#   A socket.io server
#
# Dependencies:
#   socket.io
#
# Configuration:
#   HUBOT_SOCKET_PORT
#
# Commands:
#   None
#

io = require('socket.io')
socketPort = parseInt(process.env.HUBOT_SOCKET_PORT)

module.exports = (robot) ->

  robot.socketServer = io.listen(socketPort)
  robot.socketServer.set('log level', 1)

  robot.socketServer.sockets.on 'connection', (socket) ->
    console.log 'socket.io client connected'
    socket.emit 'connected', {connect: true}