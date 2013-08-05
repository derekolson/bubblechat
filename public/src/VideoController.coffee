###
 Maintains local and remote video streams
###

define ['ServiceManager'], (ServiceManager) ->
	class VideoController
		constructor: ->
			
		init: () ->
			@remoteVideos = []

			# Ask client to use local video stream
			if(PeerConnection)
				rtc.createStream({video: true, audio: false}, @videoSuccess)

		videoSuccess: (stream) =>
			# Set Background Video to Client Video Stream
			bgVideo = document.getElementById("bgVideo")
			bgVideo.src = window.webkitURL.createObjectURL(stream)
			@remoteVideos.push(bgVideo)

			# Add remote video streams as they connect
			rtc.on('add remote stream', (stream, socketId) =>
				console.log("New Video Stream Connected")
				clone = @cloneVideo('bgVideo', socketId)
				document.getElementById(clone.id).setAttribute("class", "")
				rtc.attachStream(stream, clone.id)
				@remoteVideos.push(clone)
			)

			# Remove remote streams as they disconnect
			rtc.on('disconnect stream', (data) =>
				@removeVideo(data)
			)

		videoError: ->
			#Stubbed in / not implemented

		#Clone DOM video object
		cloneVideo: (domId, socketId) ->
			video = document.getElementById(domId)
			clone = video.cloneNode(false)
			clone.id = "remote" + socketId
			document.getElementById('remoteVideos').appendChild(clone)
			return clone
		
		#Remove DOM video object
		removeVideo: (socketId) ->
			video = document.getElementById('remote' + socketId)
			if(video)
				@remoteVideos.splice(remoteVideos.indexOf(video), 1)
				video.parentNode.removeChild(video)

	return new VideoController()

