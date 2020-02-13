* Experiment 1
* Name:
* Date:

	ORG $4000

	CLR		D1
	CLR		D2
	CLR		D3
	MOVE.W	#$200A,D2
	MOVE.W	#$1000,D3
	ADD		D2,D1
	ADD		D3,D1
	TRAP #15
	DC.W	$63
