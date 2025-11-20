#align(center)[
  Techniques et outils de l'ingénieurie logicielle

  #line(length: 100%)

  #text(size: 1.7em)[
    TP #4 (2025-11-21) --- Débogage mémoire (noté)

    Rendu papier à la fin de la séance

    Fichiers/liens → john.gliksberg\@uvsq.fr

    Sujet du mail: `"TOI/TP4 - <Nom complet>"`
  ]

  #text(size: 1.4em)[
    Décrivez votre réflexion — rédigez pour être lisible par un humain
  ]
]

#line(length: 100%)

= Débogage mémoire

== Exercice 1 : un bug dans mon Laplacien

Dans le répertoire du cours `ex1/` examinez le code fourni et tentez de le lancer.
Il semble que cela soit du traitement d'image.

+  Que fait ce code ?

   - Expliquez main.c et les différentes images créées.

   - Expliquez le principe de la convolution et du laplacien dans le traitement d'image.

+  Écrivez un Makefile simple (un seul binaire) pour ce code.

+  Le code est-il fonctionnel ?

+  Quel est le bug et comment l'avez-vous trouvé ?

+  Corrigez le bug.

== Exercice 2 : le Segfault

Ce code `ex2/` semble incorrect.
En fait, chacune des fonctions `process_data` contient une erreur.
Cependant elles ne plantent pas forcément de manière identique.

+  Expliquer en quoi chacune des fonctions `process_dataXX` est fausse.

+  En commentant et décommentant les différentes fonctions (1,2,3), expliquer l'ampleur des
   dégâts et les erreurs rencontrées pour ces trois fonctions :

    -  `process_data1` : plantage ? explication.

    - `process_data2` : plantage ? explication.

    - `process_data3` : plantage ? explication.

+  Quel outil vous permet de vous prémunir des erreurs de `process_data1` ?

   Inversement, quel autre outil utilisez-vous pour l'erreur de `process_data3` ?

+  Une corruption mémoire mène-t-elle toujours au plantage et pourquoi ?

== Exercice 3 : la fuite

Ce code `ex3/` semble avoir un problème de fuite mémoire.

+  Expliquez ce qu'est une fuite mémoire et les conséquences possibles.

+  Trouvez la fuite dans le code avec un outil.

+  Corrigez la fuite.

= Débogage logique

== Exercice 4 : la somme

+  Expliquez ce que fait ce programme.

+  Le programme fonctionne-t-il ?

+  Utilisez GDB pour afficher la valeur de `sum` à chaque coup de boucle.

+  Expliquez le bug et corrigez-le ; donnez la valeur finale de `sum`.

== Exercice 5 : Condition d'arrêt

Le code de `ex5/` contient une erreur qui mène à un crash.

+  Utilisez GDB pour trouver l'erreur.

+  Quelle est l'erreur ?

+  Corrigez l'erreur.

== Exercice 6 : Quand ça dépasse

Le code de `ex6/` contient une fonction vulnérable à un overflow.

+  Expliquez pourquoi ce code est vulnérable

+  Dessinez l'état de la pile lors de l'appel à `vulnerable_function`.

+  Comment pouvez-vous déclencher l'erreur ?

+  Que devez-vous taper dans le buffer pour changer la valeur de la variable
   `password_is_good` afin d'afficher « Vous avez cassé le MDP ! » ?

== Exercice 7 : Ça n'avance plus ?

Le code `ex7/` ne se termine jamais.

+  Expliquez ce que fait ce code :

   - Qu'est-ce qu'un thread ?

   - Qu'est-ce qu'un mutex ?

   - Que fait le code ?

+  Écrivez un makefile simple pour ce code.

   - Dépend-il d'une bibliothèque système ? Laquelle ?

+  Pourquoi le code ne se termine-t-il jamais ?

   - Comment afficher l'état du programme avec GDB ?
     Mettre des captures/copies dans le rapport de cet état.
     Que fait la commande `thread apply all bt` ?

+  Comment corriger ce code ?
