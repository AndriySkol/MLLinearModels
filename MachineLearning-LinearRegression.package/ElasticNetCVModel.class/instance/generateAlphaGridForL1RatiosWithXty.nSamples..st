helpers
generateAlphaGridForL1RatiosWithXty: xTy  nSamples: nSamples
	"works only for single output"
	^ l1Ratios collect: [ :l1Ratio | | alphaL1 |
			alphaL1 := alphas 
				ifNotNil: [ alphas ]
				ifNil: [ 			
					 self generateAlphaGridWithEps: epsilon 
				 	 	xTy: xTy
				 	 	l1Ratio: l1Ratio  
				  	 	nSamples: nSamples  ].
				
			l1Ratio -> alphaL1 
		].
  