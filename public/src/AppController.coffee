###
 AppController wires up various views
 This is heavily unfinished..
###

define [], ->
	class AppController
		init: (@appView) ->
			$(window).resize(@resize);
			@resize();

		showDetail: (data) ->
			@appView.showDetail()
			
		hideDetail: () ->
			@appView.hideDetail()

		resize: (e) =>
			w = window.innerWidth
			h = window.innerHeight
			@appView.resize(w, h)

	return new AppController()