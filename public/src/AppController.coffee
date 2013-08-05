###
 AppController wires up various views
 This is heavily unfinished..
###

define ['view/AppView', 'ParticleController'], (AppView, ParticleController) ->
	class AppController
		init: () ->
			@appView = new AppView()

			@particleControl = new ParticleController(@appView.particleContainer)

			createjs.Ticker.addEventListener("tick", @tick);
			createjs.Ticker.setFPS(60);
			createjs.Ticker.useRAF = true;

			$(window).resize(@resize);
			@resize();

		tick: (e) =>
			@particleControl.update()
			@appView.update()

		addParticle: (data) ->
			@particleControl.addParticle(data)

		removeParticle: (id) ->
			@particleControl.removeParticle(id)

		showDetail: (data) ->
			@appView.showDetail()
			
		hideDetail: () ->
			@appView.hideDetail()

		resize: (e) =>
			w = window.innerWidth
			h = window.innerHeight
			@particleControl.resize(w, h)
			@appView.resize(w, h)

	return new AppController()