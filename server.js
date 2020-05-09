var jsonServer = require('json-server')
var server = jsonServer.create()
var router = jsonServer.router('db.json')
var middlewares = jsonServer.defaults()
 
server.use(middlewares)
server.use(router)
server.listen(80, function () {
    console.log('JSON Server is running')
})

// In this example, returned resources will be wrapped in a toto property
router.render = function (req, res) {
  res.jsonp({
    toto: res.locals.data
  })
}

