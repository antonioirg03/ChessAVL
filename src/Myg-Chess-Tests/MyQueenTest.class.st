Class {
	#name : 'MyQueenTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyQueenTest >> testId [

	self assert: MyQueen new id equals: 'Q'
]

{ #category : 'tests' }
MyQueenTest >> testMoves [

	| queen squares board |
	board := MyChessBoard empty.
	board at: 'g2' put: (queen := MyQueen white).

	squares := queen targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( a2 b2 c2 d2 e2 f2 h2 g1 g3 g4 g5 g6 g7 g8 a8 b7 c6 d5 e4 f3 h1 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyQueenTest >> testMovesWhenBlocked [

	| queen squares board |
	board := MyChessBoard empty.
	board at: 'h1' put: (queen := MyQueen white).
	board at: 'g1' put: MyPawn white.
	board at: 'g2' put: MyPawn white.
	board at: 'h2' put: MyPawn white.
	squares := queen targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#(  ) collect: [ :name |
				 board at: name ])
]
