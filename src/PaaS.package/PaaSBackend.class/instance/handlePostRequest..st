request handling
handlePostRequest: request
	| pillar |
	(request contentType matches: ZnMimeType text)
		ifFalse: [ ^ ZnResponse badRequest: request ].
	pillar := request hasEntity
		ifTrue: [ request entity string ifNil: [ '' ] ]
		ifFalse: [ '' ].
	^ ZnResponse ok: (ZnEntity text: (self return: (PRPillarParser parse: pillar)))