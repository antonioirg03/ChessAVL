Class {
	#name : 'LegalMovesTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldBlockQueen [

	| king board bishop squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e8' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'b2' put: (bishop := MyBishop white).
	
	squares := board getLegalMoves: bishop.
	squaresThatShouldBeAvailable := (#( e5 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable.
	
]

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldCaptureQueen [

	| king board bishop squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'b3' put: (bishop := MyBishop white).
	
	squares := board getLegalMoves: bishop.
	squaresThatShouldBeAvailable := (#( e6 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable.
	
]

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldNotHaveAvaliableMoves [

	| king board bishop squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'b3' put: (bishop := MyBishop white).
	
	squares := board getLegalMoves: bishop.
	squaresThatShouldBeAvailable := (#( e6 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable.
	
]

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldNotMove [

	| king board bishop squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'e5' put: (bishop := MyBishop white).
	
	squares := board getLegalMoves: bishop.
	squaresThatShouldBeAvailable := (#( ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable .
]

{ #category : 'tests' }
LegalMovesTest >> testKnightShouldBlockQueen [

	| king board knight squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e8' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'd3' put: (knight := MyKnight white).
	
	squares := board getLegalMoves: knight.
	squaresThatShouldBeAvailable := (#( e5 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable.
]

{ #category : 'tests' }
LegalMovesTest >> testKnightShouldCaptureQueen [

	| king board knight squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e5' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'd3' put: (knight := MyKnight white).
	
	squares := board getLegalMoves: knight.
	squaresThatShouldBeAvailable := (#( e5 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable .
	
]

{ #category : 'tests' }
LegalMovesTest >> testKnightShouldNotHaveAvailableMoves [


	| king board knight squares squaresThatShouldBeAvailable|

	
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e8' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'e6' put: (knight := MyKnight white).
	
	squares := board getLegalMoves: knight.
	squaresThatShouldBeAvailable := (#(  ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable .
	
]

{ #category : 'tests' }
LegalMovesTest >> testPawnShouldCaptureQueen [

	| king board pawn squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'f6' put: (pawn := MyPawn white).
	
	squares := board getLegalMoves: pawn.
	squaresThatShouldBeAvailable := (#(  ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable .
	
]

{ #category : 'tests' }
LegalMovesTest >> testQueenShouldBlockQueen [

	| king board queen squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'g5' put: (queen := MyQueen white).
	
	squares := board getLegalMoves: queen.
	squaresThatShouldBeAvailable := (#( e5  ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable.
	
]

{ #category : 'tests' }
LegalMovesTest >> testQueenShouldCaptureQueen [

	| king board queen squares squaresThatShouldBeAvailable |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'g5' put: (queen := MyQueen white).
	
	squares := board getLegalMoves: queen.
	squaresThatShouldBeAvailable := (#( e7 e5 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable .
	
]

{ #category : 'tests' }
LegalMovesTest >> testQueenShouldNotHaveAvailableMoves [

	| king board queen squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'h1' put: (queen := MyQueen white).
	
	squares := board getLegalMoves: queen.
	squaresThatShouldBeAvailable := (#(  ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable .
	
]

{ #category : 'tests' }
LegalMovesTest >> testRookShouldBlockQueen [

	| king board rook squares squaresThatShouldBeAvailable |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'g5' put: (rook := MyRook white).
	
	squares := board getLegalMoves: rook.
	squaresThatShouldBeAvailable := (#( e5 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable .
	
]

{ #category : 'tests' }
LegalMovesTest >> testRookShouldCaptureQueen [

	| king board rook squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'h6' put: (rook := MyRook white).
	
	squares := board getLegalMoves: rook.
	squaresThatShouldBeAvailable := (#( e6 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self
		assertCollection: squares
		equals: squaresThatShouldBeAvailable.
	
]

{ #category : 'tests' }
LegalMovesTest >> testRookShouldNotHaveAvaliableMoves [

	| king board rook squares squaresThatShouldBeAvailable|
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'a8' put: (rook := MyRook white).
	
	squares := board getLegalMoves: rook.
	squaresThatShouldBeAvailable := (#(  ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	 
	self
		assertCollection: squares
		equals:
			squaresThatShouldBeAvailable.
	
]
