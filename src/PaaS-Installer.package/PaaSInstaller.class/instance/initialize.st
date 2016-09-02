initialization
initialize
	self ensureIceberg.
	repository := (Smalltalk classNamed: #IceRepository) origin: 'git@github.com:syrel/paas.git'.
	repository subdirectory: 'src'.
	repository register