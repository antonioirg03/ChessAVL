Class {
	#name : 'LegalMovesTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldBlockQueen [

	| king board bishop squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e8' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'b2' put: (bishop := MyBishop white).
	
	squares := bishop targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e5 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldCaptureQueen [

	| king board bishop squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'b3' put: (bishop := MyBishop white).
	
	squares := bishop targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e6 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldNotHaveAvaliableMoves [

	| king board bishop squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'b3' put: (bishop := MyBishop white).
	
	squares := bishop targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e6 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testBishopShouldNotMove [

	| king board bishop squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'e5' put: (bishop := MyBishop white).
	
	squares := bishop targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#(  ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testKnightShouldBlockQueen [

	| king board knight squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e8' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'd3' put: (knight := MyKnight white).
	
	squares := knight targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e5 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testKnightShouldCaptureQueen [

	| king board knight squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e5' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'd3' put: (knight := MyKnight white).
	
	squares := knight targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e5 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testKnightShouldNotHaveAvailableMoves [

	| king board knight squares |

	
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e8' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'a1' put: (knight := MyKnight white).
	
	squares := knight targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#(  ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testKnightShouldNotMove [

	| king board knight squares |

	
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e8' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'e6' put: (knight := MyKnight white).
	
	squares := knight targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#(  ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testPawnShouldCaptureQueen [

	| king board pawn squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'f6' put: (pawn := MyPawn white).
	
	squares := pawn targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e7 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testQueenShouldBlockQueen [

	| king board queen squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'g5' put: (queen := MyQueen white).
	
	squares := queen targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e5 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testQueenShouldCaptureQueen [

	| king board queen squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'g5' put: (queen := MyQueen white).
	
	squares := queen targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e7 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testQueenShouldNotHaveAvailableMoves [

	| king board queen squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'h1' put: (queen := MyQueen white).
	
	squares := queen targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#(  ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testRookShouldBlockQueen [

	| king board rook squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e7' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'g5' put: (rook := MyRook white).
	
	squares := rook targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e5 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testRookShouldCaptureQueen [

	| king board rook squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'h6' put: (rook := MyRook white).
	
	squares := rook targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#( e6 ) collect: [ :name |
				 board at: name ]).
	
]

{ #category : 'tests' }
LegalMovesTest >> testRookShouldNotHaveAvaliableMoves [

	| king board rook squares |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e6' put: MyQueen black.

	self assert: king isInCheck.
	
	board at: 'a8' put: (rook := MyRook white).
	
	squares := rook targetSquaresLegal: true.
	self
		assertCollection: squares
		equals:
			(#(  ) collect: [ :name |
				 board at: name ]).
	
]
