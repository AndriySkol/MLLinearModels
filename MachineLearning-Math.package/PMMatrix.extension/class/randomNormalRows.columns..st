*MachineLearning-Math
randomNormalRows: rows columns: columns 
	"Answer a new Matrix of the given dimensions filled with random numbers"
	|a b random |
	random := PMNormalDistribution new.
	a:=	(1 to: rows) collect: [:row |b:=PMVector new:columns .
		1 to: columns do: [:column |
			b  at: column put: (random random)].
		b].
	^PMMatrix rows: a