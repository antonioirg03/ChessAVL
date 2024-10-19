Class {
	#name : 'MyPlayerTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPlayerTests >> testPlayerColor [
	|player|
	player := MyPlayer new.
	player white.
	
	self assert: player color equals: Color white.
	self assert: player isWhite.
	self deny: player color equals: Color black.
	
	player black.
	self assert: player color equals: Color black.

]

{ #category : 'tests' }
MyPlayerTests >> testPlayerGame [
	|player game whiteKing|
	
	player := MyPlayer new white.
	game := MyChessGame freshGame.
	player game: game.
	
	self assert: player game equals: game.
	
	whiteKing := player king.
	self assert: whiteKing isKing.
	self assert: whiteKing isWhite. 
	
]
