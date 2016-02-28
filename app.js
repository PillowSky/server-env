'use strict'
var connect = require('connect')
var vhost = require('vhost')

var mediaflow = require('./mediaflow/app')
var stenography = require('./stenography/app')
var similarity = require('./similarity/app')
var shaderstudio = require('./shaderstudio/app')
var lessonrobot = require('./lessonrobot/app')

process.on('uncaughtException', function(error) {
		console.error(error);
});

var bridge = connect()
bridge.use(vhost('mediaflow.pillowsky.org', mediaflow))
bridge.use(vhost('stenography.pillowsky.org', stenography))
bridge.use(vhost('similarity.pillowsky.org', similarity))
bridge.use(vhost('shaderstudio.pillowsky.org', shaderstudio))
bridge.use(vhost('lessonrobot.pillowsky.org', lessonrobot))

bridge.listen(3000, function() {
		console.log('Express server listening on ' + this.address().address + ':' + this.address().port);
});