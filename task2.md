### Test Coverage et score mutations initial

Après un lancement initial de DrTest pour le package Myg-chess-tests avec le package Myg-chess-core, le score obtenu est de 43,59%.

Le score de mutations initial est de **42** (avec plus de **300** mutants vivants) après avoir lancé ce script :

```
testCases :=  { LegalMovesTest. MyPlayerTests.  MyPieceTest. MyKingTest. MyStateTest.  }.
classesToMutate := { MyChessBoard.  }.

analysis := MTAnalysis new
    testClasses: testCases;
    classesToMutate: classesToMutate.

analysis run.

analysis generalResult mutationScore.
```

Après avoir ajouté des tests pour le test coverage le score est arrivé à **61.01%**(plusiseurs tests ont été ajoutés pour augmenter encore plus ce score, mais l'outil Dr Test ne semble pas fonctionner correctement).

Après avoir ajouté des tests pour tuer les mutants le score a atteint à **82** et **113** alive mutants.

### Stratégie pour améliorer la vitesse d'exécution des mutants

Ce script a été utilisé pour obtenir des résultats plus rapides pour tuer les mutants (utilisé plus, mais moins pris en compte):

```
testCases :=  { LegalMovesTest. MyPlayerTests.  MyPieceTest. MyKingTest. MyStateTest.  MyChessBoardTest }.
classesToMutate := { MyChessBoard.  }.

analysis := MTAnalysis new
    testClasses: testCases;
    classesToMutate: classesToMutate;
	 	budget: (MTPercentageOfMutantsBudget for: 10).

analysis run.

analysis generalResult.
```

Ce script a été utilisé pour avoir tous les résultats des mutants (utilisé moins, plus pris en compte):

```
testCases :=  { LegalMovesTest. MyPlayerTests.  MyPieceTest. MyKingTest. MyStateTest.  MyChessBoardTest }.
classesToMutate := { MyChessBoard.  }.

analysis := MTAnalysis new
    testClasses: testCases;
    classesToMutate: classesToMutate;
	 	budget: (MTPercentageOfMutantsBudget for: 10).

analysis run.

analysis generalResult.
```

### Tests qui n'ont pas été crées

- tests qui vérifie que dans la fonction intializePieces la variable black n'est pas remplacée par true ou par false
- tests qui vérifie que BlBackground n'est pas remplacé par BlPaintBackground, manque de connaissance de la différence entre les deux objets
- tests qui vérifie que le mot yourself n'est pas mis à la place de plusieurs variables et valeurs dans le code, manque de connaissance du principe et fonctionnement
- tests liés à la variable state, difficile à créer la trace d'éxecution
- tests liés à la fonction getKingPieceColor pour des mutants qui remplacent [ nil ] par nil ou par [], ça n'affecte pas le comportement de l'application

### Explication détailléé de 3 mutants tués

1. Mutant qui remplace une des valeurs dans l'initialisation des pièces('a1' par exemple) par nil ou une autre valeur.

Dans les fonctions initializePieces et initializePiecesFromFEN, des mutants survivaient après avoir remplacé des cases par de mauvaises valeurs. Le but de ce test est de vérifier que seules les cases (de a1...h1, a2...h2, a7...h7, a8...h8) contiennent des pièces.

Pour tuer ces mutants, un objet MyChessGame a été initialisé avec la commande MyChessGame freshGame, puis on a récupéré le MyChessBoard.

Trois variables ont été créées pour tester que toutes les cases sont là:

- squares: une collection avec toutes les cases qu'on attend dans le board(de a1...h1, a2...h2 a7...h7, a8...h8)
- squareCount: un integer pour compter le nombre de cases qui ont des pièces
- resultSquares: une collection qui pour chaque pièce recupère le nom de sa case

Le principe de ce test est de parcurir l'ensemble des pièces presentés dans le board, parcourir la collection, si la valeur n'est pas nil on vérifie que la case de cette pièce est présente dans la collection squares, on incremente l'integer squaresCount de 1 et on ajoute la case de cette pièce à la collection resultSquares.

Finalement, on fait 2 tests, un qui vérifie que squaresCount est égale à 32 et un qui vérifie que les deux collections squares et resultSquares sont égales(réalisé avec 2 tests).

2. Mutant qui remplace une des valeurs dans l'initialisation des cases

- Dans les fonctions initializePieces et initializePiecesFromFEN 2 boucles sont utilisées pour initilaizer toutes les cases de l'echquier (de a à h et de 1 à 8).
- Des mutants qui remplaçaient une pièce par nil, yourself ou une autre valeur ont survécu.
- Le but de ce test est de vérifier que toutes les cases de a1 à h8 sont presentes.
- Pour tuer les mutants un MyChessGame a été initiailisé avec la commande `MyChessGame freshGame` et récupère le MyChessBoard.
- Une collection squares a été initialisée avec toutes les cases de a1 à h8.
- On parcourt cette collection et pour chaque nom de case on récupère la case dans le board. Si la case n'éxiste pas la methode pour récupérer la case va renvoyer nil et dans ce cas on aura un fail dans nos tests.

1. Mutant qui remplace une des valeurs des pièces

Dans les fonctions initializePieces et initializePiecesFromFEN pour chaque case(de a1...h1, a2...h2 a7...h7, a8...h8) on associe une pièce(pawn, rook, knight, bishop,queen or king). Des mutants qui remplaçaient une pièce par nil ou yourself ou une autre valeur ont survécu.

Le but de ce test est de vérifier que toutes les pièces d'un jeu d'échecs sont initialisées aux bonnes cases, de bon côté et s'assurer que le nombre de pièces est correct.
2 tests ont été crées pour tuer ces mutants.

Premier test:

On vérifie que sur les cases de a1...h1, a2...h2 il y'a que des pièces blanches.
On vérifie que sur les cases de a7...h7, a8...h8 il y'a que des pièces nores.

2 collections squaresWhite et squaresBlack ont été créées et initialisées avec les cases respectivent.

Pour chaque collection on vérifie que pour chaque case la pièce dans a la bonne couleur.

Deuxième test:

Pour tuer les mutants un MyChessGame a été initiailisé avec la commande `MyChessGame freshGame` et récupère le MyChessBoard.

Une variable de type integer a été initialisée à 0 pour chaque type de pièce(couleur + nom).

L'ensemble de pièces est parcourue, si une pièce n'est pas nil, pour la pièce correspondante on incremente le compteur.

Finalement, on va vérifier qu'on a:

- 2 black and 2 white rooks
- 2 black and 2 white knights
- 2 black and 2 white bishops
- 1 black and 1 white queens
- 1 black and 1 white kings
- 8 black and 8 white pawns
- en total 32 pièces

### Mutants équivalents

Pour le premier cas de mutants on peut considérer ces 3 mutants:

- remplace 'a1' par nil dans la fonction initializePieces
- remplace 'b1' par nil dans la fonction initializePieces
- remplace 'c1' par nil dans la fonction initializePieces

Les trois impacteent la même methode.
En faisant un seul test automatisé tous les mutants ont pu être tués.
Ils produisent le même comportement observable dans le programme, une case manquante.
Les modifications apportées sont redondantes avec la logique du code.

En conclusion on peut considérer que ces 3 mutants sont équivalents.
