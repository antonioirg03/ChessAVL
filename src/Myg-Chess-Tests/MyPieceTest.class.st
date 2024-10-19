Class {
	#name : 'MyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTest >> testIsPiece [
	|rook|
	
	rook := MyRook white.
	
	self assert: rook isPiece.
]

{ #category : 'tests' }
MyPieceTest >> testPossibleDiagonalTargets [
	| queen board squares|
	
	board := MyChessBoard empty.
	
	board at: 'b3' put: (queen := MyQueen white).
	
	squares := (#( c4 d5 e6 f7 g8  ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self 
		assert: (queen upRightDiagonal) 
		equals: squares.
		
	squares := (#( a4 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
			
	self  
		assert: (queen upLeftDiagonal) 
		equals: squares.
			
	squares := (#( c2  d1) collect: [ :name |
				 board at: name ]) asOrderedCollection.
			
	self 
		assert: (queen downRightDiagonal) 
		equals: squares.
			
	squares := (#( a2 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.

	self 
		assert: (queen downLeftDiagonal) 
		equals: squares.
]

{ #category : 'tests' }
MyPieceTest >> testPossibleTargets [
	| queen board squares|
	
	board := MyChessBoard empty.
	
	board at: 'b3' put: (queen := MyQueen white).
	
	squares := (#( c4 d5 e6 f7 g8  ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
	self 
		assert: (queen upRightDiagonal) 
		equals: squares.
		
	squares := (#( a4 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.
			
	self  
		assert: (queen upLeftDiagonal) 
		equals: squares.
			
	squares := (#( c2  d1) collect: [ :name |
				 board at: name ]) asOrderedCollection.
			
	self 
		assert: (queen downRightDiagonal) 
		equals: squares.
			
	squares := (#( a2 ) collect: [ :name |
				 board at: name ]) asOrderedCollection.

	self 
		assert: (queen downLeftDiagonal) 
		equals: squares.
]
