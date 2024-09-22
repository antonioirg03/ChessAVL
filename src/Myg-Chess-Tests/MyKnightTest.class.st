Class {
	#name : 'MyKnightTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKnightTest >> testId [

	self assert: MyKnight new id equals: 'N'
]

{ #category : 'tests' }
MyKnightTest >> testMoves [

	| knight squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (knight := MyKnight white).

	squares := knight targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( c3 c5 d2 d6 f2 f6 g3 g5 ) collect: [ :name |
				 board at: name ])
]
