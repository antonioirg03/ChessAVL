Class {
	#name : 'MyChessBoardTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessBoardTest >> testConstructor [
	|board|
	
	self should: [board := MyChessBoard new. ] raise: Error.
]

{ #category : 'tests' }
MyChessBoardTest >> testGetKingPiece [	 
	| board aPiece|
	
	board := MyChessBoard empty.
	board initializePieces.
	
	aPiece := board getKingPieceColor: Color white.
	
	self assert: aPiece color equals: Color white.
	
	aPiece := board getKingPieceColor: Color black.
	
	self assert: aPiece color equals: Color black.
	
	aPiece := board getKingPieceColor: Color orange.
	
	self assert: aPiece equals: nil.
]

{ #category : 'tests' }
MyChessBoardTest >> testGetKingPieceFromFEN [	 
	|game board aPiece|
	
	game := MyChessGame freshGame.
	board := game board.
	
	aPiece := board getKingPieceColor: Color white.
	
	self assert: aPiece color equals: Color white.
	
	aPiece := board getKingPieceColor: Color black.
	
	self assert: aPiece color equals: Color black.
	
	aPiece := board getKingPieceColor: Color orange.
	
	self assert: aPiece equals: nil.
]

{ #category : 'tests' }
MyChessBoardTest >> testGridInitialization [
	| chessBoard layout game|
        
	game := MyChessGame freshGame .
   chessBoard := game board. 
        
   layout := chessBoard layout.
        
   self assert: (layout cellSpacing = 5).
   self assert: (chessBoard columnCount = 8).
   self assert: (chessBoard rowCount = 8).
]

{ #category : 'tests' }
MyChessBoardTest >> testInitializedPieces [
	 | board squares rows columns pieces square squaresCount resultSquares|
	
	board := MyChessBoard empty.
	board initializePieces.
	
	rows := #(1 2 7 8).
	columns := #( a b c d e f g h).
	squaresCount := 0.
	resultSquares := OrderedCollection new.
	
	squares := OrderedCollection new.
	
	rows do: [ :row |
			columns do: [ :column |
					squares add: (column asString, row asString).
				].
		 ].
	
	pieces := board pieces.
	
	pieces do: [ :piece |
			piece notNil
				ifTrue: [ 
						square := piece square name.
						resultSquares add: square.
						self assert: (squares includes: square).
						squaresCount := squaresCount + 1.
					 ].
			
		 ].
	
	self assert: squaresCount = 32.
	self assert: (squares includesAll: resultSquares).
	self assert: (resultSquares includesAll: squares).
	
	

	

]

{ #category : 'tests' }
MyChessBoardTest >> testInitializedPiecesFromFEN [
	 |game board squares rows columns pieces square squaresCount resultSquares|
	
	game := MyChessGame freshGame.
	board := game board.
	rows := #(1 2 7 8).
	columns := #( a b c d e f g h).
	squaresCount := 0.
	resultSquares := OrderedCollection new.
	
	squares := OrderedCollection new.
	
	rows do: [ :row |
			columns do: [ :column |
					squares add: (column asString, row asString).
				].
		 ].
	
	pieces := board pieces.
	
	pieces do: [ :piece |
			piece notNil
				ifTrue: [ 
						square := piece square name.
						resultSquares add: square.
						self assert: (squares includes: square).
						squaresCount := squaresCount + 1.
					 ].
			
		 ].
	
	self assert: squaresCount = 32.
	self assert: (squares includesAll: resultSquares).
	self assert: (resultSquares includesAll: squares).
	
	

	

]

{ #category : 'tests' }
MyChessBoardTest >> testInitializedSquares [
	 | board squares rows columns isAbsent|
	
	board := MyChessBoard empty.
	board initializePieces.
	rows := #(1 2 3 4 5 6 7 8).
	columns := #( a b c d e f g h).
	
	squares := OrderedCollection new.
	
	rows do: [ :row |
			columns do: [ :column |
					squares add: (column asString, row asString).
				].
		 ].
	
	
	squares do: [ :aSquare | 
			isAbsent := board at: aSquare.
			self assert: isAbsent notNil.
		].
	
	

	

]

{ #category : 'tests' }
MyChessBoardTest >> testInitializedSquaresFromFEN [
	 |game board squares rows columns isAbsent|
	
	game := MyChessGame freshGame.
	board := game board.
	rows := #(1 2 3 4 5 6 7 8).
	columns := #( a b c d e f g h).
	
	squares := OrderedCollection new.
	
	rows do: [ :row |
			columns do: [ :column |
					squares add: (column asString, row asString).
				].
		 ].
	
	
	squares do: [ :aSquare | 
			isAbsent := board at: aSquare.
			self assert: isAbsent notNil.
		].
	
	

	

]

{ #category : 'tests' }
MyChessBoardTest >> testPieceInitialization [
	| board pieces blackKnights blackPawns blackBishops blackQueen blackKing blackRooks whiteKnights whitePawns whiteBishops whiteQueen whiteKing whiteRooks|
	
	board := MyChessBoard empty.
	board initializePieces.
	
	 blackKnights := 0.
    blackPawns := 0.
    blackBishops := 0.
    blackQueen := 0.
    blackKing := 0.
    blackRooks := 0.
    whiteKnights := 0.
    whitePawns := 0.
    whiteBishops := 0.
    whiteQueen := 0.
    whiteKing := 0.
    whiteRooks := 0.
	
	pieces := board pieces.
	
	pieces do: [ :piece |
			piece notNil
				ifTrue: [ 
				piece id = 'N' ifTrue: [
                piece color = Color black ifTrue: [ blackKnights := blackKnights + 1 ].
                piece color = Color white ifTrue: [ whiteKnights := whiteKnights + 1 ].
            ].
            piece id = 'P' ifTrue: [
                piece color = Color black ifTrue: [ blackPawns := blackPawns + 1 ].
                piece color = Color white ifTrue: [ whitePawns := whitePawns + 1 ].
            ].
            piece id = 'B' ifTrue: [
                piece color = Color black ifTrue: [ blackBishops := blackBishops + 1 ].
                piece color = Color white ifTrue: [ whiteBishops := whiteBishops + 1 ].
            ].
            piece id = 'Q' ifTrue: [
                piece color = Color black ifTrue: [ blackQueen := blackQueen + 1 ].
                piece color = Color white ifTrue: [ whiteQueen := whiteQueen + 1 ].
            ].
            piece isKing ifTrue: [
                piece color = Color black ifTrue: [ blackKing := blackKing + 1 ].
                piece color = Color white ifTrue: [ whiteKing := whiteKing + 1 ].
            ].
            piece id = 'R' ifTrue: [
                piece color = Color black ifTrue: [ blackRooks := blackRooks + 1 ].
                piece color = Color white ifTrue: [ whiteRooks := whiteRooks + 1 ].
            ].
					 ].
			
		 ].
	
	 self assert: (blackKnights = 2).
    self assert: (whiteKnights = 2).
    self assert: (blackPawns = 8).
    self assert: (whitePawns = 8).
    self assert: (blackBishops = 2).
    self assert: (whiteBishops = 2).
    self assert: (blackQueen = 1).
    self assert: (whiteQueen = 1).
    self assert: (blackKing = 1).
    self assert: (whiteKing = 1).
    self assert: (blackRooks = 2).
    self assert: (whiteRooks = 2).
]

{ #category : 'tests' }
MyChessBoardTest >> testPieceInitializationFromFEN [
	|game board pieces blackKnights blackPawns blackBishops blackQueen blackKing blackRooks whiteKnights whitePawns whiteBishops whiteQueen whiteKing whiteRooks|
	
	game := MyChessGame freshGame.
	board := game board.
	
	 blackKnights := 0.
    blackPawns := 0.
    blackBishops := 0.
    blackQueen := 0.
    blackKing := 0.
    blackRooks := 0.
    whiteKnights := 0.
    whitePawns := 0.
    whiteBishops := 0.
    whiteQueen := 0.
    whiteKing := 0.
    whiteRooks := 0.
	
	pieces := board pieces.
	
	pieces do: [ :piece |
			piece notNil
				ifTrue: [ 
				piece id = 'N' ifTrue: [
                piece color = Color black ifTrue: [ blackKnights := blackKnights + 1 ].
                piece color = Color white ifTrue: [ whiteKnights := whiteKnights + 1 ].
            ].
            piece id = 'P' ifTrue: [
                piece color = Color black ifTrue: [ blackPawns := blackPawns + 1 ].
                piece color = Color white ifTrue: [ whitePawns := whitePawns + 1 ].
            ].
            piece id = 'B' ifTrue: [
                piece color = Color black ifTrue: [ blackBishops := blackBishops + 1 ].
                piece color = Color white ifTrue: [ whiteBishops := whiteBishops + 1 ].
            ].
            piece id = 'Q' ifTrue: [
                piece color = Color black ifTrue: [ blackQueen := blackQueen + 1 ].
                piece color = Color white ifTrue: [ whiteQueen := whiteQueen + 1 ].
            ].
            piece isKing ifTrue: [
                piece color = Color black ifTrue: [ blackKing := blackKing + 1 ].
                piece color = Color white ifTrue: [ whiteKing := whiteKing + 1 ].
            ].
            piece id = 'R' ifTrue: [
                piece color = Color black ifTrue: [ blackRooks := blackRooks + 1 ].
                piece color = Color white ifTrue: [ whiteRooks := whiteRooks + 1 ].
            ].
					 ].
			
		 ].
	
	 self assert: (blackKnights = 2).
    self assert: (whiteKnights = 2).
    self assert: (blackPawns = 8).
    self assert: (whitePawns = 8).
    self assert: (blackBishops = 2).
    self assert: (whiteBishops = 2).
    self assert: (blackQueen = 1).
    self assert: (whiteQueen = 1).
    self assert: (blackKing = 1).
    self assert: (whiteKing = 1).
    self assert: (blackRooks = 2).
    self assert: (whiteRooks = 2).
]

{ #category : 'tests' }
MyChessBoardTest >> testWhiteAndBlackPositions [
	 | board rowsWhite rowsBlack squaresBlack squaresWhite columns|
	
	board := MyChessBoard empty.
	board initializePieces.
	
	rowsWhite := #( 1 2 ).
	columns := #( a b c d e f g h).
	rowsBlack := #( 7 8 ).
	squaresWhite := OrderedCollection new.
	squaresBlack := OrderedCollection new.
	
	rowsWhite do: [ :row |
			columns do: [ :column |
					squaresWhite add: (column asString, row asString).
				].
		 ].
	
	rowsBlack do: [ :row |
			columns do: [ :column |
					squaresBlack add: (column asString, row asString).
				].
		 ].	
	
	squaresWhite do: [ :square |
			|piece|
			piece := (board at: square) contents.
			self assert: piece isWhite.
		 ].
	
	squaresBlack do: [ :square |
			|piece|
			piece := (board at: square) contents.
			self assert: piece isWhite not.
		 ].
	

	

]

{ #category : 'tests' }
MyChessBoardTest >> testWhiteAndBlackPositionsFromFEN [
	 |game board rowsWhite rowsBlack squaresBlack squaresWhite columns|
	
	board := MyChessBoard empty.
	board initializePieces.
	rowsWhite := #( 1 2 ).
	columns := #( a b c d e f g h).
	rowsBlack := #( 7 8 ).
	squaresWhite := OrderedCollection new.
	squaresBlack := OrderedCollection new.
	
	rowsWhite do: [ :row |
			columns do: [ :column |
					squaresWhite add: (column asString, row asString).
				].
		 ].
	
	rowsBlack do: [ :row |
			columns do: [ :column |
					squaresBlack add: (column asString, row asString).
				].
		 ].	
	
	squaresWhite do: [ :square |
			|piece|
			piece := (board at: square) contents.
			self assert: piece isWhite.
		 ].
	
	squaresBlack do: [ :square |
			|piece|
			piece := (board at: square) contents.
			self assert: piece isWhite not.
		 ].
	

	

]
