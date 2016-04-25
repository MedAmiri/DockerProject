# Platforme de publication de données Géographiques

## Objectif du projet

Création d'un SIG de type cloud résilient qui répondera aux deux points suivants:
- Publier des données géographiques
- Pouvoir en rajouter

## Analyse et choix techniques

 * Un cluster docker mixte de machines linux et de raspberry Pi
 * Docker swarm pour orchestrer le cluster depuis une seule machine
 * Geoserver pour la publication et la gestion  des données géographiques
 * PostgreSQL et son extension géographique PostGis pour stockage des données géographiques
 * Pgpool afin d'assurer la duplication des données sur les noeuds
 * HAproxy pour l'équilibrage de charge
 * KeepAlived pour une haute disponibilité

## Commencements:

 * Chaque entité  dans un conteneur isolé
 * Test des conteneurs séparément
    - Dockerfile et docker-compose pour HAproxy et KeepAlived avec une application type Nginx ou Apache
    - Dockerfile et docker-compose pour Geoserver PostGis et Pgpool

## Rassembler le tout:

 * Utilisation de Consul pour enregistrer les noeuds
 * Docker Swarm pour orchestrer le cluster

## Architecture 
 
 ### Architecture matérielle 

![Architecture Physique](https://github.com/MedAmiri/Docker_GiS_Project/blob/master/Architecture/physiq.png?raw=tru "Architecture physique")

 ### Architecture logicielle

![Architecture Logicielle](https://github.com/MedAmiri/Docker_GiS_Project/blob/master/Architecture/logiciel.png?raw=tru "Architecture logicielle")

 ### Sous la loupe ... Swarm reigne !!

![Architecture Effective](https://github.com/MedAmiri/Docker_GiS_Project/blob/master/Architecture/effective.png?raw=tru "Architecture effective")


