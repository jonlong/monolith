fs = require 'fs'
jade = require 'jade'

module.exports = serveHTML = (req, res, viewsPath, fileName, templateOptions) ->
 
  viewPath = viewsPath + fileName + '.jade'

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
    html = fn templateOptions

    res.writeHead 200, {"Content-Type": "text/html"}
    res.end html