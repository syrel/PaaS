public
handleRequest: request
  request uri path = self path
    ifTrue: [
		request method = #POST
        ifTrue: [ ^ self handlePostRequest: request ].
		request method = #GET
        ifTrue: [ ^ self handleGetRequest: request ]. ].
   ^ ZnResponse notFound: request uri