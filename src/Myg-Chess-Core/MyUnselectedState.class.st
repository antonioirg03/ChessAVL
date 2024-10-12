Class {
	#name : 'MyUnselectedState',
	#superclass : 'Object',
	#instVars : [
		'board'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyUnselectedState class >> board: aBoard [

	^ self new
		  board: aBoard;
		  yourself
]

{ #category : 'accessing' }
MyUnselectedState >> board [

	^ board
]

{ #category : 'accessing' }
MyUnselectedState >> board: anObject [

	board := anObject
]

{ #category : 'events' }
MyUnselectedState >> clickOn: aMyChessSquare [
	"Nothing is selected.
	Select the chess square"
	aMyChessSquare select.
	aMyChessSquare contents ifNotNil: [
		|aPiece legalMoves square|
		aPiece := aMyChessSquare contents.

		square := aPiece square.
		legalMoves := board getLegalMoves: aPiece.		
		
		board highLightTargets: legalMoves.
		].

	^ MySelectedState board: board selected: aMyChessSquare
]
