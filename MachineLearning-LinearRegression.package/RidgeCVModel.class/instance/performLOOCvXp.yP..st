configuration
performLOOCvXp: preprocessInput yP: preprocessOutput
	| u uTy decomposition s2 |
	decomposition := preprocessInput x decomposeJacobOnesideSvd.
	u := decomposition leftSingularForm.
	" some check required if s values are too ??"
	s2 := decomposition sForm collect: [ :si | si squared ].
	uTy := preprocessOutput y * u.
	^ alphas
		collect: [ :alpha | 
			| w c gDiag |
			" some check required if s values are too ??"
			w := s2 collect: [ :el | 1 / (el + alpha) - (1 / alpha) ].
			c := u * (self diagDot: w vector: uTy)
				+ (1 / alpha * preprocessOutput y).
			gDiag := (self decompDiag: w matrix: u) + (1 / alpha). 
	
			(c / gDiag inject: 0 into: [ :mse :el | mse + el squared ])
				/ c size ]