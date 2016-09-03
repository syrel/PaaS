request handling
handlePostRequest: request
	| piller badRequest |
	badRequest := [ ^ ZnResponse badRequest: request ].
	(request hasEntity and: [ request contentType matches: ZnMimeType text ])
		ifFalse: badRequest.
	piller := request entity string ifNil: ''.
	^ ZnResponse ok: (ZnEntity text: (self return: (PRPillarParser parse: piller)))