* Experiment 3

	ORG	$4000

	MOVE.W	#$4,D0
	MOVE.W	#$5,D1
	CLR		D2
	SUB		#1,D0
	ADD		D1,D2
	ADD		D0,D2
	TRAP #15
	DC.W	$63