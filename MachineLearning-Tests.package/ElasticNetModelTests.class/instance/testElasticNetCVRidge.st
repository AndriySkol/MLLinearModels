tests
testElasticNetCVRidge
	| arr xTrain yTrain xTest yTest |
	" xTrain . xTest  . yTrain . yTest "
	arr := self generateDatasetWithSampleSize: 200 nFeatures: 100 nInformative: 100.
	xTrain := arr at: 2.
	xTest := arr at: 3.
	yTrain := arr at: 4.
	yTest := arr at: 5.
	model := ElasticNetCVModel new 
			alphas: { 0.01 . 0.05 . 0.1 }; 
			maxIter: 100; 
			epsilon: 2e-3;
			tol: 1e-4 ; 
			selection: 'cyclic';  
			l1Ratios: {0.5 . 0.7 }.
	model fit: xTrain to: yTrain checkInput: true.
	self assert: model minAlpha almostEquals: model alphas min.
	self assert: model minL1 almostEquals: model l1Ratios min.
	self assert: (model model score: xTest output: yTest) > 0.99.