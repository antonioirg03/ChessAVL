Class {
	#name : 'MyFENTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyFENTest >> testGrammarFuzz [
	| r corpus|
	
	"exemple de string non valide qui ne passe pas"
	r := 'QNqn3B5N/Q3nkn56P/83b1QRp2/NBP2Q512/kBq5KKrp/67PRPQ34/3kQ3kRRk/3Nq852RP b k 3c 6 2'.
	
	self should: [corpus := MyFENParser parse: r.] raise: Error.
	
	r := '////////'.
	
	self should: [corpus := MyFENParser parse: r.] raise: Error.
	
	r := '1/1/1/1/1/1/1/1 b - - 2 2'.
	
	self should: [corpus := MyFENParser parse: r.] raise: Error.	

	
	
	
]

{ #category : 'tests' }
MyFENTest >> testParseBlackPawn [

	| parser piece |
	parser := MyFENParser forString: 'p'.
	piece := parser parsePiece.
	
	self assert: piece equals: 'Black pawn'
]

{ #category : 'tests' }
MyFENTest >> testParseRank [

	| parser rank |
	parser := MyFENParser forString: 'p2rQknB'.
	rank := parser parseRank.
	
	self assert: rank asArray equals: #(
		'Black pawn'
		$2
		'Black rook'
		'White queen'
		'Black king'
		'Black knight'
		'White bishop'
	)
]

{ #category : 'tests' }
MyFENTest >> testParseWhitePawn [

	| parser piece |
	parser := MyFENParser forString: 'P'.
	piece := parser parsePiece.
	
	self assert: piece equals: 'White pawn'
]

{ #category : 'tests' }
MyFENTest >> testShowParserExistingBugs [
	
	
	| r corpus|
	
	"fen string non valide, mais aucune erreur"
	r := 'r1q5p6bR/7N8Kn3qQ/343KrPrq/p2kn38Qr/QQqrnPbk/62NBPnrK/48qBRKqq/BB2k7rnN b QQkq - 4 980'.
	
	corpus := MyFENParser parse: r.
	
	"il devrait passer"
	r := '8/8/8/8/8/8/8/8 b - - 1 1'.
	
	self should: [corpus := MyFENParser parse: r.] raise: Error.
	
	"il ne devrait pas passer, juste K pour les options de castle"
	r := 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KKKK - 0 1'.
	
	corpus := MyFENParser parse: r.
	
	"il devrait passer, échequier plein"
	r := 'rnbqkbnr/rnbqkbnr/rnbqkbnr/rnbqkbnr/rnbqkbnr/rnbqkbnr/rnbqkbnr/rnbqkbnr w - - 0 1'.
	
	self should: [corpus := MyFENParser parse: r.] raise: Error.
	
	"il ne devrait pas passer, x pour le nombre de fullmoves"
	r := 'rnbqkbnr/pppppppp/8/8/8/8/PPkkPPPP/RNBQKBNR w KQkq - 0 1xmqslc'.
	
	corpus := MyFENParser parse: r.
	
	"pareil"
	r := 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0qsdza 1'.
	
	corpus := MyFENParser parse: r.
	
	"il devrait passer, le premier rank n'a que 8 cases"
	r := 'r2k22/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1'.
	
	self should: [corpus := MyFENParser parse: r.] raise: Error.
	
	"pas sûr s'il devrait passer ou pas, mais il passe"
	r := 'rnbqkbnr/pppppppp/8/8/8/11111111/PPPPPPPP/RNBQKBNR w kkkk - 0 1'.
	
	corpus := MyFENParser parse: r.
	
	"il ne devrait pas passer, le deuxième rank a 9 cases"
	r := 'rnbqkbnr/pp2ppppp/8/8/8/11111111/PPPPPPPP/RNB4KB2R w kkkk - 0 1'.
	
	corpus := MyFENParser parse: r.
	
	"c'est une position correcte d'en passant, il ne devrait pas y avoir d'erreur"
	r := 'rnbqkbnr/ppp1pppp/8/3p4/8/8/PPPP1PPP/RNBQKBNR b KQkq d6 0 2'.
	
	self should: [corpus := MyFENParser parse: r. ] raise: Error.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
]
