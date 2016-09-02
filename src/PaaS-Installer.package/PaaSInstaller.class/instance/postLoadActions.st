actions
postLoadActions
	| pragmas |
	repository pull.
	
	pragmas := OrderedCollection new.
	Object withAllSubclassesDo: [:each |
		pragmas addAll: (Pragma allNamed: #paasPostLoad in: each) ].
	pragmas do: [ :each | each method methodClass baseClass perform: each method selector ]