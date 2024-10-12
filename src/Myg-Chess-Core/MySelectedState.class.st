Class {
	#name : 'MySelectedState',
	#superclass : 'Object',
	#instVars : [
		'board',
		'selection'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'instance creation' }
MySelectedState class >> board: aBoard selected: aMyChessSquare [

	^ self new
		  board: aBoard;
		  selection: aMyChessSquare;
		  yourself
]

{ #category : 'accessing' }
MySelectedState >> board [

	^ board
]

{ #category : 'accessing' }
MySelectedState >> board: anObject [

	board := anObject
]

{ #category : 'events' }
MySelectedState >> clickOn: aMyChessSquare [
	"We should only move if it's legal but..."
	|aPiece legalMoves squares|
	selection unselect.
	selection contents ifNotNil: [
		
		aPiece := selection contents.

		squares := aPiece legalTargetSquares.
		legalMoves := squares select: [ :targetSquare
			 |  board isLegalMove: aPiece from: (aPiece square) to: targetSquare ].
		
		board unhighLightTargets: legalMoves.
		
		(legalMoves includes: aMyChessSquare) ifTrue:[board game move: aPiece to: aMyChessSquare].
		
		 ].

	^ MyUnselectedState board: board
]

{ #category : 'accessing' }
MySelectedState >> selection [

	^ selection
]

{ #category : 'accessing' }
MySelectedState >> selection: anObject [

	selection := anObject
]
