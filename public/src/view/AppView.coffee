###
 Main Application View
 Sets up EaselJS stage / canvas
###
define ['view/DetailView', 'ParticleController'], (DetailView, ParticleController) ->
	class AppView
		constructor: (canvasId="canvas") ->
			console.log("AppView Init")
			
			@stage = new createjs.Stage(canvasId)

			if createjs.Touch.isSupported()
				createjs.Touch.enable(@stage)
				@stage.canvas.style.cursor = "none"

			@particleContainer = new createjs.Container()
			@stage.addChild(@particleContainer)

			@particleControl = new ParticleController(@particleContainer)
			
			@detailView = new DetailView(@stage.canvas.width, @stage.canvas.height)
			@stage.addChild(@detailView)

			createjs.Ticker.addEventListener("tick", @tick);
			createjs.Ticker.setFPS(60);
			createjs.Ticker.useRAF = true;

		tick: (e) =>
			if(@particleControl.physics.particles.length < 5)
				@particleControl.addParticle()
			
			if(Math.random() > 0.995)
				@particleControl.addParticle()

			@particleControl.update()
			@stage.update()

		resize: (w, h) ->
			@stage.canvas.width = w;
			@stage.canvas.height = h;
			@detailView.resize(w, h)
			@particleControl.resize(w, h)
			# console.log(@stage.canvas.width + " : " + @stage.canvas.height)

		showDetail: () ->
			@detailView.show()

		hideDetail: () ->
			@detailView.hide()