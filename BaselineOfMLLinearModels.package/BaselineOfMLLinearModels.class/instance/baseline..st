baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [
			spec
    				baseline: 'PolyMath'
    				with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src'];
					import: 'PolyMath'.
 			"spec 
				baseline: 'DataFrame' with: [  
    					spec
						repository: 'github://PolyMathOrg/DataFrame'.	
					];
				import: 'DataFrame'."
				"Packages"
				spec
     					
					package: 'MachineLearning-Math' with: [
						spec requires: #('Polymath')
						];
					package: 'MachineLearning-CrossValidation' with: [
						spec requires: #('Polymath')
						];
					package: 'MachineLearningPreprocessing'  with: [
						spec requires: #('Polymath')
						]
					"package: 'MachineLearning-LinearRegression' with: [
						spec requires: #('MachineLearning-Math' 'MachineLearning-CrossValidation' 
											'MachineLearningPreprocessing'  'DataFrame')
						];"
					"package: 'MachineLearning-Tests' with: [ 
						spec requires: #('MachineLearning-LinearRegression')
		 				]".


				spec
					"group: 'LinearModels' with: #('MachineLearning-LinearRegression');"
					group: 'Math' with: #('MachineLearning-Math');
					group: 'CrossValidation' with: #('MachineLearning-CrossValidation');
					group: 'Preprocessing' with: #('MachineLearning-Preprocessing');
					"group: 'Tests' with: #('MachineLearning-Tests');
					group: 'all' with: #('Tests');"
					group: 'default' with: #('Math') ].