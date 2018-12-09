accessing
solveSVDWithUtY: uTy s: s alpha: alpha v: v
	| sUTy |
	"diag^T(s[j,j]/(s[j,j]^2+alpha)) * u^t* y, if diagonal is larger than some little value 1e-15"
	sUTy := ((1 to: s size)
		collect: [ :i | 
			| sDiagVal scale |
			sDiagVal := s at: i.
			scale := sDiagVal > 1e-15
				ifTrue: [ sDiagVal / (sDiagVal squared + alpha) ]
				ifFalse: [ 0 ].
			(uTy at: i) * scale ]) asPMVector.
	^ v * sUTy