as yet unclassified
diagDot: d vector: b 
	"comment stating purpose of message"

	^ ((1 to: d size) collect: [ :i | (d at: i) * (b at: i) ]) asPMVector.