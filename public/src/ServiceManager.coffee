###
 Maintains socket connection to Node/Socket.io Server
###

define [], ->
	class ServiceManager
		constructor: ->

		connect: (onConnected) ->
			@socket = io.connect('/')
			
			# WebRTC Signaling Channel API 
			rtc.connect(@socket)
			rtc.on('connect', ->
				console.log("WebRTC Connected")
				onConnected()
			)

			# SocketIO Connection
			@socket.on('connect', ->
				
			)

			# Connection Confirmed by Server
			@socket.on('confirm', (data) ->
				# console.log(data);
			)

			# New Data Received
			@socket.on('update', (data) ->
				# console.log(data);
			)

		init: ->
			

		# Send Data to Server
		send: (event, data) ->
			console.log "Socket Send Event: " + event
			@socket.emit(event, data)

	return new ServiceManager()