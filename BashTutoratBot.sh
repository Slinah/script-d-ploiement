 #!/bin/bash

RED='\033[0;32m'
BLUE='\034[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

[[ "$(id -u)" != "0" ]] && {
    echo -e $"${RED}Tu n'es pas en root :'(${NC}"
} 

while :
do
echo -e "
${GREEN}---Menu du Script---${NC}

${MARRON}1- Update/Upgrade & installation des paquets.
2- Création d'utilisateurs.
3- SSH.
4- Configuration de la BDD.
5- Quitter le script --->[].${NC}
"
stty -echo
read chx_menu
stty echo

pause (){
    echo -e "${GREEN}Appuyer sur une touche ${NC}"
    read -p "$*"
}

if [ $chx_menu = 1 ]; then # test si le numéro 1 est sélectionner.
  echo -e "${MARRON}1- Update/Upgrade & installation des paquets.${NC}" 
  debian=$(grep "Debian" /etc/issue | cut -c1-6)#Stocke la distribution des OS dans la variable debian
  if [[ $debian = Debian ]]; then #si l'OS est debian
    echo -e "${GREEN}Tu as Debian !${NC}"
    echo -e "${GREEN}Programme d'installation de Debian :)${NC}"
    debxport=$(grep "export maccent" /etc/bash.bashrc | cut -c8-14 | head -n 1)
    #stocke le résultat de la première ligne et des caractères 8 à 14 pour la recherche
    #"export maccent" du fichier bash.bashrc dans la variable debxport
    if [[ $debxport = maccent ]]; then #si debxport = maccent
      command > /dev/null 2>&1 #ne rien faire
    fi
       cd /etc
    echo "tutoratBot" > hostname #changer le nom de la machine
    cd /etc/apt/ #mise a jour des sources
    echo "deb http://deb.debian.org/debian/ stable main contrib non-free
    deb-src http://deb.debian.org/debian/ stable main contrib non-free

    deb http://deb.debian.org/debian/ stable-updates main contrib non-free
    deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free" > sources.list

    echo -e "${GREEN}Les sources ont été modifiées (t'es maintenant sûr de pouvoir installer).${NC}"
    #Update upgrade des sources
    apt-get update -y --force-yes #update/upgrade
    apt-get upgrade -y --force-yes
    echo -e "${GREEN}Update/Upgrade effectués${NC}"  
