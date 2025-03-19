# LeLegendeDAlex

Un jeu de rôle d'aventure en vue du dessus de style La Légende de Zelda

## De que çé
### Histoire

Le Légende D'Alex est un jeu de rôle d'aventure s'inspirant des jeux 2D de la série La Légende de Zelda où le héro doit s'attaquer a plusieurs donjons afin de récupérer différents outils qui lui permettront de progresser dans le donjon ultime et finalement vaincre le vilain ultime.

Armé d'une épée et d'un bouclier, le héro se fait donner la tâche de libérer son village du mal qui a pris possession du donjons où sont enterrés les défunts du village. Cependant, ce maléfice s'est enfermé derrières trois loquets (barrures physique? magique?) dont les clefs sont gardés par les bras droits, gauches et centre du mal suprêmes et se cachent dans les donjons de trois villages environnants. En plus d'abriter les loyaux serviteurs du roi des ténèbres, chaque donjon cache en son sein un outil permettant à notre aventurier de progresser au delà d'obstacles autrement infranchissables.

### Les systèmes
Le jeu utilisera 4 systèmes: les outils, les niveaux de maîtrise, les PNJ et les ennemies.
#### Les outils
7 outils sont fournis au joueur afin de progresser dans le jeu:
- L'épée
- Le bouclier
- Les trousses de soins
- Le grapin
- Les bombes
- Le boomerang
- Les bottes ailées

L'Épée et le bouclier sont obtenus au début du jeu et sont nécessaire pour se battre contre les différents ennemies.
Les trousses de soins servent à récupérer de la vie et sont retrouvées en tuant des ennemies et en brisant des objets de décoration.
Le grapin, le boomerang et les bombes se trouvent dans les 3 premiers donjons et sont nécessaire pour progresser dans le donjon final.
Les bottes ailées sont cachées au sein du dernier donjon et sont utile pour y progresser plus facilement.

##### Utilisation
###### Épée
L'épée est une épée et est utilisée pour se battre. On peut frapper avec et ça fait du dégâts aux ennemies et à certains éléments du décors. De base elle frappe de 1 point de vie. On commence la partie avec elle.

###### Bouclier
Le bouclier sert à se protéger des coups. En restant immobile, le bouclier intercepte les coups suffisamment faibles qui arrivent de directement en face du joueur. De base, il bloque les coups de 1 point de dégât. Les coups dépassant les dégâts bloqués se comportent ainsi:
Pour un bouclier bloquant x point de vie (PV) recevant un coup de y PV
- si y <= x : aucun dégâts subits
- si x < y <= 2x : y - x dégâts subits
- si 2x < y: y dégâts subits
Ainsi, le bouclier bloque complétement les attaques inférieures ou égales à son niveau de protection, déduit son niveau de protection des coups supérieurs jusqu'à 2 fois sont niveau de protection et laisse complètement passer les coups supérieurs à 2 fois son niveau de protection. Ainsi, le bouclier de base bloque tous les coups de 1 PV, laisse 1 PV passer pour les coups de 2 PV et laisse 3 PV passe5r pour les coups de 3 PV

On l'obtiens soit en l'achetant, soit en réalisant une quête secondaire avant de l'avoir acheté. *Il n'est pas nécessaire pour passer le jeu, mais il est dont utile.*

###### Trousses de soins
Les trousses de soins redonnent un peu de vie au joueur Elles redonnent de base 1 point de vie. De base, elles demandes 4 secondes d'immobilité pour prendre effet. Elle peuvent être obtenues en tuant des ennemis et en les achetant aux magasins.

###### Grapin
Permet de tirer le joueur vers des structures en bois se trouvant directement devant lui, lui permettant de franchir le vide ou de longues distances un peu plus rapidement. Les structures de bois peuvent inclure des boucliers ennemis. On l'obtient dans un des premiers donjons.

###### Bombes
Permettent de briser des murs fragiles afin d'ouvrir de nouveaux passages. On ne peut en porter qu'un nombre limité (à déterminer). On peut en trouver dans la nature (comme les bombes fleur de zelda). Après avoir obtenus le sac à bombes dans son donjon, les ennemies peuvent en donner à leur mort et on peut en transporter jusqu'à 10.

###### Boomerang
Reviens systématiquement vers le lanceur après avoir atteint la fin de sa trajectoire ou un obstacle comme un ennemi ou un mur. Se lance en ligne droite dans la direction du regard du lanceur. Ramassera le premier item récoltable par le joueur sur son chemin et le lui rapportera. Immobilise les ennemis qu'il percute. On l'obtient dans un des premiers donjons.

###### Bottes ailées
Permettent de marcher pour un court temps sur le vide et sur l'eau comme s'il s'agissait de plancher. De base, le vol s'interrompt si le joueur s'immobilise ou essaie d'utiliser un outil.

#### Les niveaux de maîtrise
En utilisant ses différents outils, le joueur devient meilleur pour les maîtriser. Cela est représenté par un gain de points d'expérience qui augmentent le niveau de maîtrise de 4 compétences. Chaque outil a une compétence associé. Utiliser l'outil augmente l'expérience (et donc le niveau) de sa compétence. Chaque niveau de compétence améliore la maîtrise des outils qui lui sont attachés. Les 4 compétences sont les suivantes:
- La médecine (MED): Kits de soins
- L'attaque (ATQ): Épée
- La défense (DEF): Bouclier
- La dextérité (DEX): Grapin, Bombes, Boomerang, Bottes ailées

Aux niveaux 5, 10 et 15, certains NPC vendront des améliorations pour les outils de la compétences lui attribuant de meilleurs effets.

##### MED
La médecine est la capacité à se soigner. Chaque utilisation d'une trousse de soins donne de l'expérience dans le domaine. Chaque niveau augmente les soins de 1 point de vie. Ex: Au niveau 1, une trousse redonne 1 point de vie en 4 secondes et au niveau 6 elle donne 6 points de vie en 2 secondes,

|       NIV        |           5           |        10         |                  15                  |
| :--------------: | :-------------------: | :---------------: | :----------------------------------: |
| Trousse de soins | Soins 2x plus rapides | Soins instantanés | Soins jusqu'à 110% de la vie maximal |

##### ATQ
L'attaque est la capacité à attaquer. Chaque ennemi tué donne de ;'expérience dans le domaine. Chaque niveau augmente la force d'attaque de 1 point de vie.

| NIV  |               5                |             10             |                                        15                                         |
| :--: | :----------------------------: | :------------------------: | :-------------------------------------------------------------------------------: |
| Épée | Ruée vers l'avant en attaquant | L'épée frappe à 360 degrés | La ruée devient une attaque sautée, permetant de franchir un petit espace de vide |

##### DEF
La défense est la capacité à se protéger. Chaque coup bloqué avec le bouclier donne de l'expérience dans le domaine. Chaque niveau augment le nombre de point de vie bloqués de 1.

|   NIV    |                                   5                                   |                            10                            |                                   15                                   |
| :------: | :-------------------------------------------------------------------: | :------------------------------------------------------: | :--------------------------------------------------------------------: |
| Bouclier | Réduit de 1 les points de vie de l'attaque avant les autres calculs\* | Bouclier actif lors de l'utilisation de trousse de soins | Réduit de 5 les points de vie de l'attaque avant les autres calculs­­' |
\*Ainsi, au niveau 5, après avoir acheté l'amélioration, un coup de 6 au bouclier ne fera pas de dégâts, un coup de 11 fera 5 dégâts, mais un coup de 12 fera 12 dégâts.
'Ainsi, au niveau 15, après avoir acheté l'amélioration, un coup de 20 au bouclier ne fera pas de dégâts, un coup de 35 fera 15 dégâts, mais un coup de 36 fera 36 dégâts.

##### DEX
La dextérité est la capacité à utiliser un outil. Chaque utilisation utile\* d'un des 4 outils de temple donne de l'expérience. Chaque niveau augmente la porté des outils (traduit par une plus longue durée pour les bottes).

|      NIV      |                                             5                                             |                                                10                                                 |                               15                               |
| :-----------: | :---------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------: | :------------------------------------------------------------: |
|    Grapin     | Permet de rester collé sur la cible (mais seule action possible est de se laisser tomber) | Ajoute un deuxième grapin (rajoute l'option de jeter un nouveau grapin lorsque collé à une cible) |   Le grapin peut faire mal aux ennemis (ATQ/5) points de vie   |
|    Bombes     |                      Permet de repérer facilement les murs fragiles                       |                                Double la capacité du sac à bombes                                 | Permet de bloquer (3xDEF)% dégâts d'explosion avec le bouclier |
|   Boomerang   |                  Inflige (ATQ/5) points de vie au contacte d'un ennemie                   |                       Ne s'arrête pas au contacte d'ennemies sans bouclier                        |                 Peut briser les murs fragiles                  |
| Bottes ailées |                              Permet de s'immobiliser en vol                               |                                 Permet d'utiliser un outil en vol                                 |      S'immobiliser en vol met le minuteur de vol en pause      |


## Mécaniques optionnelles
### Monter sur les toits
Pouvoir monter sur les toits des villes, agissant comme un nouveau niveau où les espaces entre les toits sont du vide.

### Un casino
Un casino permettrais de rentre les sous supplémentaires non superflus.