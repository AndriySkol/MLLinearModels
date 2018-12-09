accessing
solveAsSvd: x output: y alpha: alpha
	| decomposition u v s uTy |
	
	decomposition := x decomposeJacobOnesideSvd.
	u := decomposition leftSingularForm.
	v := decomposition rightSingularForm.
	s := decomposition sForm.
	uTy := y * u.
	^ self
		solveSVDWithUtY: uTy
		s: s
		alpha: alpha
		v: v