
/**
 * Module dependencies.
 */
var express = require('express')
  , routes = require('./routes')
  , http = require('http')
  , path = require('path');
  //, auth = express.basicAuth('prophet', 'live')


var app = express()
  , server = require('http').createServer(app)
  , io = require('socket.io').listen(server)
  , webrtc = require('./webrtc');


//Configure Express Server
app.configure(function(){
  app.set('port', process.env.PORT || 8000);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

//Socket IO Config
io.configure(function () {
  io.enable('browser client minification');  // send minified client
  io.set("transports", ["xhr-polling"]);  //XHR required for Heroku
  io.set("polling duration", 10); 
  io.set('log level', 1)  //reduce logging
});


//Start HTTP Server
server.listen( app.get('port'), function(){
  console.log("Express/socket.io server running on port "+app.get('port'));
});


//WebRTC Signaling Channel (project_root/webrtc)
webrtc.init(io)

//Routing
app.get('/', routes.index);
