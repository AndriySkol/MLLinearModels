helpers
pathResidualsPrecomputed: alphaPath l1Ratio: l1Ratio trainxTx: xTx trainxTy: xTy preprocessTrainX: pX preprocessTrainY: pY testX: testX testY: testY
	"comment stating purpose of message"
	| l1mses lastCoef rescaledCoefs |
	lastCoef := Array new: xTx numberOfRows withAll: 0.
	l1mses := alphaPath collect: [ :alpha | | pathRes prediction mse |
		pathRes := self pathInputPrecomputedxTx: xTx 
			xTy: xTy 
			output: pY y
			l1Penality: alpha * l1Ratio * pY y size
			l2Penalty: alpha * (1 - l1Ratio) * pY y size
			tol: tol 
			coefs: lastCoef  
			maxIter: maxIter. 
			
		lastCoef := pathRes coefs.
		rescaledCoefs := lastCoef * (alpha * (1 - l1Ratio) + 1).
		prediction := self predictX: testX 
			coefs: rescaledCoefs 
			xScale: pX xScale 
			xOffset: pX xOffset  
			yOffset: pY yOffset.
		
		mse := self mseForPredicted: prediction  withActual: testY.
		mse.
		].
	
	^l1mses.