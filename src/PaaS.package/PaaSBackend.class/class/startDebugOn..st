launching
startDebugOn: aPort
	self startOn: aPort.
	
	ZnServer default logToTranscript.
	ZnServer default debugMode: true.