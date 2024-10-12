### Kata choisi: Restrict legal moves

Pour pouvoir implémenter cette fonctionnalité, une approche TDD a été utilisée.

Le but est de pouvoir changer des choses sans casser d'autres choses dans le processus.

On peut séparer les tests en 2 parties :

1. Tests pour les comportements des pièces
   Les mouvements de chaque pièce sont testés.
   Les méthodes de la classe pour voir si l'id est correct pour chaque type de pièce.
   Des cas spécifiques pour voir ce qui se passe si d'autres pièces sont sur le chemin.
   Ces tests sont présents ici pour s'assurer qu'au fur et à mesure de l'évolution du programme, on ne casse pas le fonctionnement normal de l'application.

1. Tests pour définir les mouvements permis
   4 types de tests sont appliqués pour chaque pièce :

- Un test pour vérifier que le seul mouvement possible si le roi est attaqué est de capturer la reine.
- Un test pour vérifier que le seul mouvement possible si le roi est attaqué est de se mettre devant pour bloquer.
- Un test pour vérifier que si la pièce en question ne rentre dans aucun des deux premiers cas, aucun mouvement n'est disponible.
- Un test pour vérifier que si sur la même trajectoire où la pièce est placée, une pièce de l'opposition attaque le roi, notre pièce n'a pas de mouvement disponible.

### Des tests qui n'ont pas été implementés

- vérifier quand un joueur gagne
- tester si une partie est arrivé à un stalemate
- tester si le mouvement de "castle" fonctionne corréctement côté roi et côté reine
- tester que le même jouer ne peut pas jouer deux fois consecutivement
- tester si un pion quand il est sur la première rangée peut faire un mouvement en avant de deux cases
- tester tous les cas possible pour capturer une pièce de l'adversaire

### Kata

Pour résoudre le kata, plusieurs fonctions ont été créées, notamment isLegalMove et getLegalMoves. La fonction isLegalMove prend en paramètre une pièce, la case de départ de la pièce et la case de destination. La fonction simule le mouvement, teste si après ce mouvement le roi est en échec et après on remet les pièces à leur position. Si le roi est en échec, on renvoie false, sinon true. La fonction getLegalMoves prend en paramètre une pièce et renvoie tous les mouvements légaux qu'on peut faire avec cette pièce. La fonction récupère tous les mouvements possibles et, en utilisant la fonction isLegalMove, décide lesquels sont légaux ou pas, puis elle renvoie cette collection.

Les tests ont beaucoup aidé à résoudre ce kata, parce que j'ai défini le comportement du logiciel avant de développer les fonctions, ce qui m'a permis de rattraper plus rapidement quelques bugs :

- vérifier que si la case dans laquelle on veut mettre la pièce n'a pas déjà une pièce, ce n'est pas la peine de remettre quelque chose à la place (la case a la valeur nil)
- récupérer le roi de la bonne couleur pour vérifier s'il est toujours en échec
- la logique des fonctions, comment vérifier qu'un mouvement est bien légal ou pas
- garder dans une variable temporaire la pièce originale

### Des erreurs qui sont toujours presentes dans l'application

- quand on clique sur un pion, il bouge directement dans la case (c'est la seule pièce qui a ce comportement)
- par la suite, la case avec le mouvement possible reste **highlighted**
