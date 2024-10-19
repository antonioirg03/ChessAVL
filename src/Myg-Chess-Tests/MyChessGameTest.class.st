Class {
	#name : 'MyChessGameTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessGameTest >> testBoard [
	| game board |
	
	board := MyChessBoard empty.
	game :=  MyChessGame freshGame.
	
	game board: board.
	
	self assert: game board equals: board.
]
