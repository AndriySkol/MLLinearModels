as yet unclassified
generateDatasetWithSampleSize: nSamples nFeatures: nFeatures nInformative: nInformative
	"comment stating purpose of message"

	| xTrain yTrain w xTest yTest |
	
	xTrain := PMMatrix randomNormalRows: nSamples columns: nFeatures.
	xTest := PMMatrix randomNormalRows: nSamples columns: nFeatures.
	w := PMVector newNormalRandom: nFeatures.
	nInformative + 1 to: nFeatures do: [ :i | 
		w at: i put: 0.
		 ].
	yTrain := xTrain * w.
	yTest := xTest * w.
	^ { w . xTrain . xTest  . yTrain . yTest  }