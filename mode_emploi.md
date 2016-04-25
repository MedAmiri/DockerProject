# Mode d'emploi de l'application :

## Haproxy
 * installer haproxy sur les deux noeuds
 * dans /etc/haproxy/haproxy.conf ajouter les adresses ip des machines noeuds
 
## keepAlived
 * installer keepAlived sur les deux noeuds
 * dans /etc/keepAlived/keepalived.conf 
   - mettre state à MASTER dans le noeud1 (Pi2) et à BACKUP dans le noeud2 (Pi3)
   - mettre priorit à 100 dans le noeud1 (Pi2) et à 101 dans le noeud2 (Pi3)
   - rentrer une ip virtuelle 
## Consul:
  * Installer Consul dans la machine linux
  * lancer avec la commande : 
    - consul agent -dev -ui -ui-dir /chemin/vers/ui -bind ip/de/la/machine/contrôle -client ip/de/la/machine/contrôle

## Configuration des raspberry:
  * Enregistrement des Pi dans consul: 
ajouter dans /etc/default/docker
la ligne DOCKER_OPTS="--storage-driver=overlay -D -H tcp://0.0.0.0:2375 --cluster-store=consul://ip-machine-contrôl:8500 --cluster-advertise=eth0:2375"

## Orchestrer avec Swarm:
  * Lancer le manager dans (pi 1) depuis  la machine de contrôl avec la commande : 
docker -H tcp://ip-noeud1:2375 -p 7979:8080 run -d hypriot/rpi -swarm manage -H tcp://0.0.0.0:8080 consul://ip-machine-contrôl:8500

  * Lancer les noeuds avec la commande :
    - Noeud1:pi2 docker -H tcp://ip-noeud1:2375 -p 7979:8080 run -d hypriot/rpi -swarm join --advertise ip-noeud1:2375 consul://ip-machine-contrôl:8500
    - Noeud2:pi3 docker -H tcp://ip-noeud1:2375 -p 7979:8080 run -d hypriot/rpi -swarm
join --advertise ip-noeud1:2375 consul://ip-machine-contrôl:8500

## Un petit coup de docker compose:
  * docker-compose --x-networking --x-network-driver=overlay up -d

## le resultat dans le navigateur .. =) !!
taper l'adresse ip virtuelle de keepAlived
