###
 VideoParticle shows various video streams
 This needs more work..
###

define ['view/particles/ParticleView', 'VideoController'], (ParticleView, VideoController) ->
	class VideoParticle extends ParticleView
		constructor: (data) ->
			super(data)

			bg = new createjs.Shape()
			bg.graphics.beginFill('#ffffff').drawCircle(0, 0, @radius)
			@addChild(bg)

			# Grab a random remote video stream
			video = VideoController.remoteVideos[Math.floor(Math.random() * VideoController.remoteVideos.length)] #document.getElementById("bgVideo")
			if(video)
				bitmap = new createjs.Bitmap(video)
				bitmap.x = -320
				bitmap.y = -240
				@addChild(bitmap)

			# Mask video
			videoMask = new createjs.Shape()
			videoMask.graphics.beginFill('#ffffff').drawCircle(0, 0, @radius - 3)
			bitmap.mask = videoMask

			# Show Location Overlay
			txt = new createjs.Text("CHICAGO", "40px kiosk_light", "#ffffff")
			txt.textBaseline = "middle"
			txt.textAlign = "center"
			txt.lineWidth = 400
			@addChild(txt)
			#TODO - fix cache to be dynamic
			txt.cache(-txt.lineWidth/2, -20, txt.lineWidth, 40)

			@hitArea = bg