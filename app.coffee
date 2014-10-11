connect = require 'connect'
vhost = require 'vhost'

iportal = require('./iportal/app').app
campus = require('./smart-campus-backend/app').app

bridge = connect()
bridge.use(vhost('iportal.pillowsky.org', iportal))
bridge.use(vhost('campus.pillowsky.org', campus))

bridge.listen 8000, ->
	console.log "Listening on #{this.address().address}:#{this.address().port}"
