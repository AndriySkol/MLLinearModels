baselines
baseline01: spec 
  <version: '0.1-baseline'>

  spec for: #common do: [  
    spec blessing: #baseline.
    spec repository: 'http://https://github.com/AndriySkol/MLLinearModels'.
    spec
      package: 'Machine-Learning-LinearRegression' with: [
		spec requires: #('MachineLearning-Math' 'MachineLearning-CrossValidation' 
							'MachineLearningPreprocessing', 'DataFrame')
	];
	package: 'MachineLearning-Math' with: [
		spec requires: 'Polymath'
	];
	package: 'MachineLearning-CrossValidation' with: [
		spec requires: 'Polymath'
	];
	package: 'MachineLearningPreprocessing'  with: [
		spec requires: 'Polymath'
	];
	package: 'MachineLearning-Tests' with: [ 
		spec requires: 'MachineLearning-LinearRegression'
		 ].

    spec
    	baseline: 'PolyMath'
    	with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ].
 
    spec
	baseline: 'DataFrame'
	with: [ spec repository: 'github://PolyMathOrg/DataFrame';
				 version: #development 
		].
  ]
