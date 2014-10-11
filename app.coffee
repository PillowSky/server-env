'use strict'
connect = require 'connect'
vhost = require 'vhost'

iportal = require('./iportal/app').app
campus = require('./smart-campus-backend/app').app
mongo = require('./mongo-express/app')

bridge = connect()
bridge.use(vhost('pillowsky.org', iportal))
bridge.use(vhost('iportal.pillowsky.org', iportal))
bridge.use(vhost('campus.pillowsky.org', campus))
bridge.use(vhost('mongo.pillowsky.org', mongo))

bridge.listen 8000, ->
	console.log "Listening on #{this.address().address}:#{this.address().port}"
