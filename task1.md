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
