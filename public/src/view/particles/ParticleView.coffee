###
 Base Particle View
###
define ['AppController'], (AppController) ->
	class ParticleView extends createjs.Container
		constructor: (@data) ->
			super()
			@radius = 200
			@scaleX = @scaleY = Math.random() * 0.4 + 0.6

			@dragOffset = new createjs.Point()
			# @addEventListener("mousedown", @onClick)
			@addEventListener("mousedown", @startDrag)
			
			# Transition in on creation
			@show()

		
		onClick: (e) =>
			# Show DetailView for this Particle
			AppController.showDetail(@data)

		# Dragging Behavior
		startDrag: (e) =>
			@dragOffset.x = e.stageX - this.x;
			@dragOffset.y = e.stageY - this.y;

			@parent.addChild(this)
			@particle.lock()
			e.addEventListener("mousemove", @doDrag)
			e.addEventListener("mouseup", @stopDrag)

		doDrag: (e) =>
			@particle.x = e.stageX - @dragOffset.x
			@particle.y = e.stageY - @dragOffset.y

		stopDrag: (e) =>
			@particle.unlock()
			e.removeEventListener("mousemove", @doDrag)
			e.removeEventListener("mouseup", @onMouseUp)

		show: (onComplete=null) ->
			# TweenLite.from(this, 1, {scaleX:0, scaleY:0, ease:Elastic.easeOut})
			TweenLite.from(this, 0.5, {scaleX:0, scaleY:0, ease:Expo.easeOut, onComplete:onComplete})

		hide: (onComplete=null) ->
			TweenLite.to(this, 0.5, {scaleX:0, scaleY:0, ease:Expo.easeOut, onComplete:onComplete})

		# Destroy view and clean up after
		destroy: ->
			@hide(@cleanUp)

		cleanUp: =>
			@particle = null
			@parent.removeChild(this)
			@uncache()
			@removeAllEventListeners()