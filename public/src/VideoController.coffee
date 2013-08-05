###
 Maintains local and remote video streams
###

define ['AppController'], (AppController) ->
	class VideoController
		constructor: ->
			
		init: () ->
			@remoteVideos = []

			# Ask client to use local video stream
			if(PeerConnection)
				rtc.createStream({video: true, audio: false}, @videoSuccess)

		videoSuccess: (stream) =>
			# Set Background Video to Client Video Stream
			@bgVideo = document.getElementById("bgVideo")
			@bgVideo.src = window.webkitURL.createObjectURL(stream)
			@remoteVideos.push(@bgVideo)

			AppController.addParticle({ type:'video', id:@bgVideo.id, video:@bgVideo.id })

		videoError: ->
			#Stubbed in / not implemented

		addRemoteStream: (stream, id) ->
			clone = @cloneVideo('bgVideo', id)
			clone.setAttribute("class", "")
			rtc.attachStream(stream, clone.id)
			@remoteVideos.push(clone)

			AppController.addParticle({ type:'video', id:clone.id, video:clone.id })
			return clone

		#Clone DOM video object
		cloneVideo: (domId, id) ->
			video = document.getElementById(domId)
			clone = video.cloneNode(false)
			clone.id = "remote" + id
			document.getElementById('remoteVideos').appendChild(clone)
			return clone
		
		#Remove DOM video object
		removeVideo: (id) ->
			video = document.getElementById('remote' + id)
			if(video)
				AppController.removeParticle(video.id)
				@remoteVideos.splice(@remoteVideos.indexOf(video), 1)
				video.parentNode.removeChild(video)

	return new VideoController()

