###
 Main Application View
 Sets up EaselJS stage / canvas
###
define ['view/DetailView'], (DetailView) ->
	class AppView
		constructor: (canvasId="canvas") ->
			console.log("AppView Init")
			
			@stage = new createjs.Stage(canvasId)

			if createjs.Touch.isSupported()
				createjs.Touch.enable(@stage)
				@stage.canvas.style.cursor = "none"

			@particleContainer = new createjs.Container()
			@stage.addChild(@particleContainer)
			
			@detailView = new DetailView(@stage.canvas.width, @stage.canvas.height)
			@stage.addChild(@detailView)

		update: ->
			@stage.update()

		resize: (w, h) ->
			@stage.canvas.width = w;
			@stage.canvas.height = h;
			@detailView.resize(w, h)
			# console.log(@stage.canvas.width + " : " + @stage.canvas.height)

		showDetail: () ->
			@detailView.show()

		hideDetail: () ->
			@detailView.hide()