Class {
	#name : 'MyPawnTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTest >> testId [

	self assert: MyPawn new id equals: 'P'
]

{ #category : 'tests' }
MyPawnTest >> testMoves [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( c3 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTest >> testNoMoreMoves [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'c8' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#(  ) collect: [ :name |
				 board at: name ])
]
