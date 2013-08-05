###
 Main requireJS kick-off
 Loads all dependencies and Starts Application
###

# require.config({
#     urlArgs: "bust=" + (new Date()).getTime() # Cache Busting
# })

requirejs ['Resources', 'AppController', 'ServiceManager'], (Resources, AppController, ServiceManager) ->
	Resources.load ->
		# Kick-off App
		AppController.init()
		# Connect to Socket IO Server
		ServiceManager.connect ->


	# Disconnect on refresh / close
	window.addEventListener("unload", ->
		rtc.disconnect();
	)

	# window.onbeforeunload = (e) ->
		# rtc.disconnect();
		# message = "Disconnecting Kiosk"
		# e = e || window.event;
		# if (e)
		# 	e.returnValue = message;
		# return message;
