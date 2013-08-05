###
 Kudos Particle
 Heavily unfinished..
###
define ['view/particles/ParticleView', 'Resources'], (ParticleView, Resources) ->
	class BuzzParticle extends ParticleView
		constructor: (data) ->
			super(data)

			@radius = 237

			# Grab image from the resource loader
			bg = new createjs.Bitmap(Resources.get("buzz_bg"))
			bg.regX = @radius
			bg.regY = @radius
			@addChild(bg)
			
			@hitArea = bg
			
			kudosType = new createjs.Shape()
			kudosType.graphics.beginFill('#ef5639').drawCircle(0, 0, 32)
			kudosType.y = -95
			@addChild(kudosType)

			#TODO - write text formatter/truncator
			dummyTxt = "Happy 3 year anniversary! We are all so lucky to have you! Happy 3 year anniversary!"
			dummyTxt = dummyTxt.toUpperCase()

			txt = new createjs.Text(dummyTxt, "30px kiosk_light", "#ffffff")
			txt.y = 0
			txt.textAlign = "center"
			txt.lineWidth = @radius * 1.5
			@addChild(txt)


			# Cache particle view - faster performance and better text rendering
			@cache(-@radius, -@radius, @radius*2, @radius*2)