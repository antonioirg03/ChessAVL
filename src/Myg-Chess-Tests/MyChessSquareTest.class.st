Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testBoard [
	|square board|
	
	board := MyChessBoard empty.
	square := MyChessSquare new.
	square board: board.
	
	self assert: (square board) equals: board.
	
]

{ #category : 'tests' }
MyChessSquareTest >> testBoardClick [
	|square board|
	
	board := MyChessBoard empty.
	square := MyChessSquare new.
	square board: board.
	
	self assert: square board equals: board.
	
]

{ #category : 'tests' }
MyChessSquareTest >> testRenderQueenKing [
	|square board queen newSquare|
	
	board := MyChessBoard empty.
	square := MyChessSquare white.
	square board: board.
	
	self assert: square board equals: board.
	
	queen := MyQueen white.
	square contents: queen.
	self assert: square contents equals: queen.
	self assert: square color equals: Color white.
	self assert: (square renderQueen: queen) equals: 'Q'.
	
	queen := MyQueen black.
	self assert: (square renderQueen: queen) equals: 'W'.
	
	newSquare := MyChessSquare black.
	self assert: (newSquare renderQueen: queen) equals: 'w'.
	
	queen := MyQueen white.
	self assert: (newSquare renderQueen: queen) equals: 'q'. 
	
	



]

{ #category : 'tests' }
MyChessSquareTest >> testSquareHasPiece [
	|square board pawn|
	
	board := MyChessBoard empty.
	square := MyChessSquare white.
	square board: board.
	
	self assert: square hasPiece equals: false.
	
	square contents: (pawn := MyPawn white).
	
	self assert: square hasPiece equals: true.
	
	self assert: square contents equals: pawn.
	
	square emptyContents.
	
	self assert: square contents equals: nil.
]
