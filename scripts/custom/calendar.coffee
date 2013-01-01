# Description:
#   A socket.io server
#
# Dependencies:
#   ical
#   config
#   cron
#
# Configuration:
#   config.people['user'].icloud.calendars
#   config.people['user'].icloud.pollingRate
#
# Commands:
#   None
#

ical = require('ical')
config = require('./../../config')
Cron = require('cron').CronJob
date = new Date();

calendars = config.jon.icloud.calendars

cron = new Cron(
  cronTime: config.jon.icloud.pollingRate
  onTick: ->
    robot.events.emit 'fetchCalendars'
  start: false
)

fetchCalendars = () ->
  i = 0
  while i < calendars.length
    ical.fromURL calendars[i], {}, (err, data) ->
      console.log "err", err
      console.log data
    i++

module.exports = (robot) ->

  robot.events.on 'fetchCalendars', ->
    fetchCalendars()

  robot.events.on 'startCalendarCron', ->
    cron.start()

  robot.events.on 'stopCalendarCron', ->
    cron.stop()