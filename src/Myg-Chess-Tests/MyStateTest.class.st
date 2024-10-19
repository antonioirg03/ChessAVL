Class {
	#name : 'MyStateTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyStateTest >> testSquareSelection [
	|selectedState board game square|
	
	game := MyChessGame freshGame.
	board := game board.
	square := board at: 'e5'.
	selectedState := MySelectedState board: board selected: square.
	
	self assert: selectedState board equals: board.
	self assert: selectedState selection equals: square.
	
	square := board at: 'b1'.
	selectedState selection: square.
	
	self assert: selectedState selection equals: square.
	
	
]

{ #category : 'tests' }
MyStateTest >> testUnselected [
	|unselectedState board game |
	
	game := MyChessGame freshGame.
	board := game board.
	unselectedState := MyUnselectedState board: board.
	
	self assert: unselectedState board equals: board.
]
