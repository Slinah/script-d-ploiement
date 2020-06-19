 #command to execute it on debian chmod +x .sh
 #!/bin/bash

RED='\031[0;47m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'
userdeladebian = "leo"
echo $userdeladebian

if [ "$(id -u)" != 0 ]; then
  echo "${RED}Tu n'es pas en root :'(${NC}"
  exit 2
fi
while :
do
echo "
${GREEN}---Menu du Script---${NC}

${BLUE}1- Update/Upgrade & installation des paquets.${NC}
${BLUE}2- Configuration de la BDD.${NC}
${BLUE}3- L'api ruby, et l'api discord.${NC}
${BLUE}4- Quitter le script et reboot de la machine --->[].${NC}

${GREEN}--------------------${NC}
"
#stty -echo #cacher l'affichage des iputs à l'écran
read chx_menu
stty echo

if [ $chx_menu = 1 ]; then # test si le numéro 1 est sélectionner.
  echo "${BLUE}1- Update/Upgrade & installation des paquets.${NC}" 
  cd /etc
  echo "tutoratBot" > hostname #changer le nom de la machine
  cd /etc/apt/ #mise a jour des sources
  echo "deb http://deb.debian.org/debian/ stable main contrib non-free
  deb-src http://deb.debian.org/debian/ stable main contrib non-free
  deb http://deb.debian.org/debian/ stable-updates main contrib non-free
  deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free" > sources.list
  echo "${GREEN}Les sources ont été modifiées (t'es maintenant sûr de pouvoir installer).${NC}"
  #Update upgrade des sources
  apt-get update -y #update/upgrade
  apt-get upgrade -y
  echo "${GREEN}Update/Upgrade effectués${NC}"
  echo "${GREEN}Installation de MariaDB${NC}"
   #Installation du paquet MariaDB
  apt-get install mariadb-server -y
  sudo apt-get install libmariadb-dev -y
  echo "${GREEN}Paquet MariaDB installé.${NC}"
elif [ $chx_menu = 2 ]; then # test si le numéro 4 est sélectionner.
  echo "${GREEN}---Configuration de MariaDB---${NC}"
  sudo apt install mariadb-server -y #Installe MariaDB
  mysql_secure_installation
  systemctl start mariadb #Lance le système MariaDB
  systemctl enable mariadb #Active MariaDB a chaque démarrage de la machine
  mysql -u root "create user adminBot;" #Creation de l'user 'adminBot'
  mysql -u root "create database tutoratBot;" #Création de la BDD tutoratBot
  mysqldump -u root -p tutoratBot < /home/leo/script-delpoiement/tutorat.sql #Import du script SQl dans la base de données du tutorat
  #echo -e "${RED}Avant de CONTINUER !!!!${NC} transferer le fichier 'index.php' et donner la localisation de l'erreur d'accès"
  #read location
  echo "${GREEN}---- Voila MariaDB est configurée ! Félicitations !"
elif [ $chx_menu = 3 ]; then # test si le numéro 3 est sélectionner.
  apt install ruby-full -y # installation de ruby
  echo "${GREEN}Ruby installe.${NC}"
  git clone https://github.com/Slinah/api-refonte-tutorat.git # on clone l'api de notre bot
  echo "${GREEN}L'API a été clone.${NC}"
  gem install bundler
  su leo #on ce connecte en un utilisateur pour eviter le sudo du script
  pi  #mot de passe du user
  bundle install # et on peut installer l'api
  exit # puis on ce deconnecte pour retrouver le sudo
  apt install libssl-dev libffi-dev libsqlite3-dev zlib1g-dev gcc g++ make
  wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz
  echo "${GREEN}Python est installé.${NC}"
  tar xzvf Python-3.6.4.tgz
  cd Python-3.6.4/
  ./configure
  make
  make install
  echo "${GREEN}Python OK.${NC}"
  python3 -m pip install -U discord.py[voice]
  echo "${GREEN}L'API Discord.py a été cloné.${NC}"
  mkdir bot
  cd bot
  git clone https://github.com/Slinah/stage_refonte_bot.git
  echo "${GREEN}Le bot a été cloné.${NC}"
  sudo systemctl start python3 bot.py thread.py dependencies.py #Lance le système du bot
  sudo systemctl enable python3 bot.py thread.py dependencies.py #Active le bot a chaque démarrage de la machine
elif [ $chx_menu = 4 ]; then # test si le numéro 5 est sélectionner.
  echo "${RED}Tu nous quittes :c${NC}"
  reboot
  exit 1
fi
done

