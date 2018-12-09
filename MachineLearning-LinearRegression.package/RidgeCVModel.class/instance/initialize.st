initialization
initialize

	super initialize.

	alphas := { 1e-2 . 1e-1 . 1 . 10 } .
	minAlpha := nil.
	minMse := nil.
	mses := nil.
	cv := KFoldSeparator new.