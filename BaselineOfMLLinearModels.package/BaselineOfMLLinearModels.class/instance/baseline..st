baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
    				baseline: 'PolyMath'
    				with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ];
				import: 'PolyMath'.
 			"spec 
				baseline: 'DataFrame' with: [  
    					spec
						repository: 'github://PolyMathOrg/DataFrame'.	
					];
				import: 'DataFrame'."
				"Packages"
				spec
     					 package: 'MachineLearning-LinearRegression' with: [
						spec requires: #('MachineLearning-Math' 'MachineLearning-CrossValidation' 
											'MachineLearningPreprocessing'  "'DataFrame'")
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

				"Groups"
				spec
					group: 'LinearModels' with: #('Machine-Learning-LinearRegression');
					group: 'Math' with: #('MachineLearning-Math');
					group: 'CrossValidation' with: #('MachineLearning-CrossValidation');
					group: 'Preprocessing' with: #('MachineLearning-Preprocessing');
					group: 'Tests' with: #('MachineLearning-Tests');
					group: 'all' with: #('Tests');
					group: 'default' with: #('all') ].