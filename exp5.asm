* Experiment 5


* Code that initializes port F and write value $AB to it 
PORTF0	EQU	$FFFA18
DDRF	EQU	$FFFA1C
PFPAR	EQU	$FFFA1E

	ORG	$5000

START 
	MOVE.W	#$0000,PFPAR
	MOVE.W 	#$00FF,DDRF
	MOVE.W 	#$00AB,PORTF0

* prepare to write to the LCD display
	MOVE.W 	#$0004,PEDR 
* bit 3 2 1 0
*     0 1 0 0
*     E R/W RS
	MOVE.W 	#$000F,PFDR
* send the DISPLAY ON command to the LCD 
*   			  RS  RW  D7  D6  D5  D4  D3  D2  D1  D0
* Display control 0   0   0   0   0   0   1   D   C   B

* D = 1 = display ON
* D = 0 = display OFF
* --------------------
* C = 1 = cursor ON
* C = 0 = cursor OFF
* --------------------
* B = 1 = cursor BLINKING
* B = 0 = cursor NOT BLINKING

* WRITE ASCII DATA TO PORT F and STROBE using E=0
* and DELAY in between strobes
* WRITE "T" ASCII 54H
	MOVE.W 	#$0005,PEDR 
* bit 3 2 1 0
* 	  0 1 0 1
* 	  E R/W RS note RS = 1 for
* writing data into LCD
	MOVE.W 	#$0054,PFDR 
* send "T" to the LCD
	BSR DELAY

	MOVE.W 	#$0001,PEDR 
* make E = 0 (info strobed to Display)
* bit 3 2 1 0
* 	  0 0 0 1
* 	  E R/W RS note RS = 1 for
* writing data into LCD
	BSR DELAY

