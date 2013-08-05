###
 Twitter particle view
 Heavily unfinished...
###

define ['view/particles/ParticleView', 'Resources'], (ParticleView, Resources) ->
	class TwitterParticle extends ParticleView
		constructor: (data) ->
			super(data)

			@radius = 250
			width = @radius+22

			# Grab image from the resource loader
			bg = new createjs.Bitmap(Resources.get("twitter_bg"))
			bg.regX = @radius
			bg.regY = @radius
			@addChild(bg);
			
			@hitArea = bg

			#TODO - write text formatter/truncator
			userName = data.user ? "Prophet"
			userHandle = data.handle ? "@ProphetBrand"
			bodyCopy = data.text ? "Our work w/@TMobile including the recently announced Jump program, featured ..."

			userTxt = new createjs.Text(userName.toUpperCase(), "30px kiosk_black", "#253746")
			userTxt.y = -@radius + 80
			userTxt.textAlign = "center"
			userTxt.lineWidth = @radius * 1.5
			@addChild(userTxt)

			handleTxt = new createjs.Text(userHandle, "30px kiosk_book", "#253746")
			handleTxt.y = userTxt.y + 40
			handleTxt.textAlign = "center"
			handleTxt.lineWidth = @radius * 1.5
			@addChild(handleTxt)

			bodyTxt = new createjs.Text(bodyCopy, "30px kiosk_black", "#ffffff")
			bodyTxt.y = handleTxt.y + 60
			bodyTxt.textAlign = "center"
			bodyTxt.lineWidth = @radius * 1.5
			@addChild(bodyTxt)

			# Cache particle view - faster performance and better text rendering
			@cache(-@radius, -@radius, width*2, @radius*2)