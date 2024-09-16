Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testId [

	self assert: MyKing new id equals: 'K'
]

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsQueen [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsQueenDiagonal [

	| king board |
	board := MyChessBoard empty.
	board at: 'g8' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'd5' put: MyQueen black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e1' put: MyRook black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckByOpponentsQueen [

	| king board |
	board := MyChessBoard empty.
	board at: 'g8' put: (king := MyKing black).

	"Put an atacker rook on e column"
	board at: 'd4' put: MyQueen white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColor [

	| king board |
	board := MyChessBoard empty.
	board at: 'g8' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'd5' put: MyQueen white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColorRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an same color rook on e column"
	board at: 'e1' put: MyRook white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testMoves [

	| king squares board |
	board := MyChessBoard empty.
	board at: 'c6' put: (king := MyKing white).

	squares := king targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( b5 c5 d5 b6 d6 b7 c7 d7 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyKingTest >> testMovesCorner [

	| king squares board |
	board := MyChessBoard empty.
	board at: 'a8' put: (king := MyKing white).

	squares := king targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( a7 b7 b8 ) collect: [ :name |
				 board at: name ])
]
