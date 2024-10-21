Class {
	#name : 'MyFENParserGrammar',
	#superclass : 'GncBaseGrammar',
	#instVars : [
		'ntWhitePieces',
		'ntBlackPieces',
		'ntRanks',
		'ntPosNumeric',
		'ntPosAlpha',
		'ntRankCase',
		'ntRankBlock',
		'ntCastleOptions',
		'ntCastleOption',
		'ntCurrentPlayer',
		'ntFenString',
		'ntNoOption',
		'ntEnPassant',
		'ntHalfMoves',
		'ntFullMoves'
	],
	#category : 'Myg-Chess-Importers',
	#package : 'Myg-Chess-Importers'
}

{ #category : 'generate' }
MyFENParserGrammar >> defineGrammar [
	
	super defineGrammar.
	
	ntWhitePieces --> 'R' | 'N' | 'B' | 'K' | 'Q' | 'P'.
	ntBlackPieces --> 'r' | 'n' | 'b' | 'k' | 'q' | 'p'.
	ntPosNumeric --> ($1-$8).
	ntPosAlpha --> ($a-$h).
	ntRankCase --> ntWhitePieces | ntBlackPieces | ntPosNumeric.
	ntRankBlock --> ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase 
	| ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase 
	| ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase, ntRankCase
	| ntRankCase, ntRankCase, ntRankCase, ntRankCase
	| ntRankCase, ntRankCase, ntRankCase
	| ntRankCase, ntRankCase 
	| ntRankCase . 
	ntRanks --> ntRankBlock, '/', ntRankBlock, '/',ntRankBlock, '/',ntRankBlock, '/',ntRankBlock, '/',ntRankBlock, '/',ntRankBlock, '/',ntRankBlock.
	ntCurrentPlayer --> 'w' | 'b'.
	ntCastleOption --> 'K' | 'k' | 'Q' |'q'.
	ntNoOption --> '-'.
	ntCastleOptions --> ntCastleOption , ntCastleOption , ntCastleOption , ntCastleOption 
	| ntCastleOption , ntCastleOption , ntCastleOption 
	| ntCastleOption , ntCastleOption 
	| ntCastleOption 
	| ntNoOption.
	ntEnPassant --> ntPosNumeric , ntPosAlpha | ntNoOption.
	ntHalfMoves --> ($0-$9) | ($1-$9), ($0-$9).
	ntFullMoves --> ($0-$9) | ($1-$9), ($0-$9) | ($1-$9), ($0-$9), ($0-$9).
	ntFenString --> ntRanks, ' ', ntCurrentPlayer ,' ', ntCastleOptions, ' ', ntEnPassant, ' ',ntHalfMoves , ' ',ntFullMoves .
	
	
	^ ntFenString.
	
]
