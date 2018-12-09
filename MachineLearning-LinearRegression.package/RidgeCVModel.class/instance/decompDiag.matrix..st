as yet unclassified
decompDiag: d matrix: q 
	| res |
	"lets calculate diag(q * d * q transposed) = (d * (q with all elements squared)) sums over rows"
	res := (1 to: q numberOfRows) collect: [ :i | | sum |
		sum := 0.
		1 to: q numberOfColumns do: [ :j |
			sum := sum + ((q at: i at: j) squared * (d at: j)) 
			 ].
			sum.
		 ].
	^ res.