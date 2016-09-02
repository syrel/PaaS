request handling
handleGetRequest: request
	^ (request uri queryAt: #pillar ifAbsent: [ nil ])
      ifNil: [ ZnResponse notFound: request uri ]
      ifNotNil: [ :pillar | ZnResponse ok: (ZnEntity text: (self return: (PRPillarParser parse: pillar))) ]