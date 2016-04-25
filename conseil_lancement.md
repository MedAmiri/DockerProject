

Platforme de publication des données Géographiques résiliente
=============================================================

Ce projet vise à créer un serveur permettant la publication de données géographiques de manière résilientes.

Prérequis
---------

Avant de procéder à l'application du projet, il convient :

- D'être muni de trois ordinateurs sous linux (distribution debian ou ubuntu)
- D'avoir docker installé sur les 3 machine : [tuto](https://docs.docker.com/engine/installation/)
- D'avoir installé Consul sur une des machines : [Téléchargement](https://www.consul.io/downloads.html)
- D'avoir installer docker-compose sur toutes les machines : 
````shell
sudo apt-get install docker-compose
````

Pour monter notre server nous allons avoir besoin de créer notre propre image. Les Dockerfile permettant la création de ces images se trouvent dans les sous-répertoires PostGis1, postGis2 et Geoserver.

Ce projet utilisera 2 Geoserver ainsi que deux autres conteneurs dans lesquels on trouvera dans chacun : 
- Une base de données postgresql avec l'extension postgis
- Un daemon pgpool permettant la réplication des bases de données

La fabrication de ces images sont décrites dans les fichiers Dockerfile des sous dossier PostGis1 PostGis2 et Geoserver (voir commentaires).

Il faut noter que le fichier pg_pool.conf ajouté dans les image postgis demande d'être modifiés en fonction du besoin. En effet, le backend_hostname0 dépend de l'IP donné aux conteneurs postgis au lancement, les paramètres présents sont ceux que nous utilisons par défaut.

Le fichier docker-compose.yml permet de rassembler les coonteneurs à créer et de les lier si besoin.

La commande :
````shell
docker-compose up -d
````

permet de lancer nos conteneurs en tâche  de fond afin de lancer un premier test.

On peut ajouter que le docker-compose.yml nous permet d'ajouter un volume, ici dans les conteneurs postgis. Ces derniers pourront par exemple contenir des données géographiques à publier.

On voit aussi un "port forward". Cela permet de donner au conteneur un port différent depuis l'extérieur que celui qu'il utilise en localhost. Cela permet d'éviter les conflict où des ports utiliseaient le même port.

Une fois nos conteneur lancés, il faut lancer le daemon pgpool dans nos deux conteneurs contenant une base de donnée :
````shell
docker exec 'nom_du_onteneur_avec_pgpool" pgpool
````
Cette commande est à exécuter sur les deux conteneurs ayant une base de donnée.

Il faut ensuit einitialiser notre base de données, pour cela on exécute notre script shell dans un des deux conteneurs. Le daemon pgpool étant, lancé, ce dernier effectuera nos requêtes sql sur nos deux bases de données :
````shell
docker exec nom_du_conteneur /home/initdb.sh
````

Si le script s'exécute normalement, il devrait affiché qu'un base a été créée, qu'une connection a été effectuée avec cette dernière et que l'extension postgis a été ajoutée.

Afin de vérifier la disponibilité de nos bases de données, il est possible de se connecter à l'adresse : localhost:8080/geoserver

On peut ainsi ajouter un workspace, puis la connection à un entrepôt. La connection à un entrepôt se fait sur l'IP du conteneur possèdant une base de données, le port 9999, en utilisateur postgres et sur la base de donénes nommées 'docker' dan sle cas de notre script initdb.sh.