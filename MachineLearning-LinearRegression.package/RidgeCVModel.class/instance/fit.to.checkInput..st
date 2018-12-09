configuration
fit: x to: y checkInput: check
	"used to start fitting elastic model"

	| preprocessInput preprocessOutput |
	preprocessInput := self
		preprocessInput: x
		center: center
		normalize: normalize.
	preprocessOutput := self preprocessOutput: y center: center.
	nFolds ifNil: [ nFolds := 1 ].
	cv input: x output: y folds: nFolds.
	mses := nFolds = 1
		ifTrue: [ 
			self performLOOCvXp: preprocessInput yP: preprocessOutput ]
		ifFalse: [ self performKCrossCV: check ].
	minMse := (mses at: 1) at: 1.
	minAlpha := (alphas at: 1) value at: 1.
	1 to: mses size do: [ :i | 
		(mses at: i) < minMse
			ifTrue: [ minAlpha := alphas at: i.
				minMse := mses at: i ] ].
	model := RidgeModel new
		alpha: minAlpha;
		shouldCenter: self shouldCenter;
		shouldNormalize: self shouldNormalize.
	model fit: x to: y checkInput: check