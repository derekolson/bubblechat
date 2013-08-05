###
 Detail State when a ParticleView has been clicked
###

define ['AppController'], (AppController) ->
	class DetailView extends createjs.Container
		constructor: (@width, @height) ->
			super()
			
			# Background Color
			@color = '#0AA5DD'
			@bg = new createjs.Shape()
			@addChild(@bg)
			@bg.alpha = 0.9

			# Circular Mask
			@mask = new createjs.Shape()
			@mask.scaleX = 0
			@mask.scaleY = 0

			# Text Formatting
			@LINE_WIDTH = 800

			@txtContainer = new createjs.Container()
			@addChild(@txtContainer)

			@headerTxt = new createjs.Text("PROPHET @ProphetBrand", "50px kiosk_black", "#405462")
			@headerTxt.lineWidth = @LINE_WIDTH
			@txtContainer.addChild(@headerTxt)

			@bodyTxt = new createjs.Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum turpis nisi, tincidunt eget iaculis id, malesuada et eros. Vestibulum luctus faucibus lacus vitae dignissim.", "30px kiosk_light", "#ffffff")
			@bodyTxt.y = 75;
			@bodyTxt.lineWidth = @LINE_WIDTH
			@txtContainer.addChild(@bodyTxt)

			@visible = false

			@addEventListener("click", @handleMouseEvent)
		
		update:(data) ->
		
		show:() ->
			@visible = true
			TweenLite.to(@mask, 0.3, {scaleX:1.0, scaleY:1.0})
		
		hide:() ->
			TweenLite.to(@mask, 0.3, {scaleX:0.0, scaleY:0.0, onComplete:@onHideComplete})
		
		onHideComplete:() =>
			@visible = false

		handleMouseEvent: (e) ->
			AppController.hideDetail()

		resize: (w, h) ->
			@width = w
			@height = h
			@bg.graphics.clear()
			@bg.graphics.beginFill(@color).drawRect(0, 0, @width, @height)
			
			# Circular Mask Redraw
			@mask.x = @width/2
			@mask.y = @height/2
			@mask.graphics.clear()
			@mask.graphics.beginFill('#ffffff').drawCircle(0, 0, @width)

			@txtContainer.x = @width / 2 - @LINE_WIDTH / 2
			@txtContainer.y = @height / 2 - 200

		destroy: ->
			@uncache()
			@removeAllEventListeners()