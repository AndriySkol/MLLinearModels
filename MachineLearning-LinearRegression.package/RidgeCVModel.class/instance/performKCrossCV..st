configuration
performKCrossCV: check
	| foldsRes |
	foldsRes := cv
		collect: [ :trainX :trainY :testX :testY | 
			| pTrainX pTrainY foldMses decomp uK vK sK uTyK |
			pTrainX := self
				preprocessInput: trainX
				center: (check and: center)
				normalize: normalize.
			pTrainY := self preprocessOutput: trainY center: center.

			decomp := pTrainX x decomposeJacobOnesideSvd.
			uK := decomp leftSingularForm.
			vK := decomp rightSingularForm.
			sK := decomp sForm.
			uTyK := pTrainY y  * uK.
			
			foldMses := alphas
				collect: [ :alpha | | coefs prediction | 
					coefs := self solveSVDWithUtY: uTyK s: sK  alpha: alpha  v: vK.
					prediction := self predictX: testX 
											 coefs: coefs 
											 xScale: pTrainX xScale
											 xOffset: pTrainX xOffset 
											 yOffset: pTrainY yOffset.
					self mseForPredicted: prediction withActual: testY 
					 ].
			foldMses ].
	^ (1 to: alphas size)
		collect:
			[ :i | (foldsRes inject: 0 into: [ :sum :el | sum + (el at: i) ]) / nFolds ]