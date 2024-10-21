### Grammar

J'ai créé ma grammaire en utilisant la librairie gnocco. Le principe était de créer des chaînes FEN correctes syntaxiquement, mais pas forcément en termes de logique, pour essayer d'attraper des bugs assez uniques. La grammaire se trouve dans la classe MyFENParserGrammar. Durant l'exécution du fuzzer, j'ai changé la grammaire plusieurs fois pour obtenir des résultats plus ciblés.

### Fuzzer

Le mutation fuzzing a été utilisé pour générer des chaînes aléatoires correspondant au format FEN. Les méthodes de la librairie Phuzzer ont été utilisées pour cette tâche.
Point important, le fuzzer choisit la plupart du temps un chemin moins coûteux lorsqu'il génère une chaîne à partir de la grammaire.

Grâce à ce script, on peut générer 100 chaine à l'aide de la grammaire et après on peut appliquer une mutation dessus.

Fuzzing:

```
grammar := (PzGrammarFuzzer on: MyFENParserGrammar new).
	corpus := (1 to: 100) collect: [ :e | grammar fuzz ].


	r := PzBlockRunner on: [ :e | anotherParser := MyFENParser forString: e.
			MyFENParser parse: e.
		 ].

	grammar run: r times: 1000.
```

Mutation fuzzing:

```
grammar := (PzGrammarFuzzer on: MyFENParserGrammar new).
	corpus := (1 to: 100) collect: [ :e | grammar fuzz ].

	r := PzBlockRunner on: [ :e | anotherParser := MyFENParser forString: e.
			MyFENParser parse: e.
		 ].

	grammar run: r times: 1000.
```

Pour chaque execution, je regardais parmis les chaines qui ne passait pas pour les tester après manuelement.

L'oracle n'a pas été implementé, parce que c'était difficile de trouver un logiciel équivalent qui satisfaisait les besoins du testing. Par manque de temps, je n'ai pas pu implementer un moi-même.

### Liste de bugs trouvés

Tous les bugs sont présents dans le fichier de testing testShowParserExistingBugs:

1. Chaine non valide en terme de logique(certains ranks ont plus de 8 cases) passe
2. échiquier vide ne passe pas
3. Le format d'options de castle n'est pas respecté, on peut avoir KKKK
4. échiquier rempli de toutes les pièces ne passe pas
5. On peut ajouter des characters après les nombre pour les halfmoves et les fullmoves
6. La plupart des ranks qui ont des pièces et des nombre ne passe pas
7. On peut ajouter un chiffre plus grand que 1 au milieu de 7 pièces et le parser va le valider
8. Aucune position d'en passant n'est pas validée par le parser
