# Description:
#   Jawbone Up History
#
# Dependencies:
#   cron
#   request
#
# Configuration:
#   None

cronJob = require('cron').CronJob
request = require('request')
config = require('../config')

getToken = (callback) ->
  user = config.jawbone.username
  password = config.jawbone.password
  service = "nudge"

  request.post 'https://jawbone.com/user/signin/login', {form: {email: user, pwd: password, service: service}}, (err, res, body) ->
    if err
      console.log 'Jawbone login error: '+ err
      return
    if !err && res.statusCode == 200
      body = JSON.parse body

      if typeof body.error != "undefined"
        console.log 'Jawbone auth error: '+ body.error.msg
        return

      token = body.token
      console.log token
      # callback(body)

module.exports = (robot) ->

  getToken();

  # robot.events.on 'visitor', (data) ->
  #   visitor = data.visitor
  #   console.log prefs[visitor].toString()
  #   message = visitor + " likes " + prefs[visitor].toString()
  #   console.log message
  #   robot.socketServer.sockets.emit('visitor', {message: message});