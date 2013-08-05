###
 Main requireJS kick-off
 Loads all dependencies and Starts Application
###

# require.config({
#     urlArgs: "bust=" + (new Date()).getTime() # Cache Busting
# })

requirejs ['Resources', 'AppController', 'view/AppView', 'VideoController', 'ServiceManager'], (Resources, AppController, AppView, VideoController, ServiceManager) ->
	Resources.load ->
		# Kick-off App
		AppController.init(new AppView())
		# Connect to Socket IO Server
		ServiceManager.connect ->
			VideoController.init()

	# Disconnect on refresh / close
	window.onbeforeunload = (e) ->
		rtc.disconnect();
		message = "Disconnecting Kiosk"
		e = e || window.event;
		if (e)
			e.returnValue = message;
		return message;
