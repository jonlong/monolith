# Description:
#   A simple dashboard
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

module.exports = (robot) ->

  robot.router.get "/hubot/dashboard", (req, res) ->
    res.end "<h1>This is Hubot version "+robot.version+"</h1>"