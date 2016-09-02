baseline
baseline: spec
	<baseline>
	spec for: #common do: [ spec
		postLoadDoIt: #postLoadActions:;
		package: 'PaaS';

		"additional development packages"
		package: 'PaaS-Installer';

		"groups without #git: prefix are loaded without git support"
		group: 'core'
			with: #('PaaS');
		group: 'development'
			with: #('core');

		"the following groups are loaded automatically with git support"
		group: 'git:core'
			with: #('PaaS-Installer');
		group: 'git:development'
			with: #('git:core');

		"#default should not be used"
		group: 'default' with: #() ].