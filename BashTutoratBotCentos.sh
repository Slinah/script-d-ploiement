  #!/bin/bash
 #command to execute it on debian chmod +x .sh
 #echo -e for colors in Centos

RED='\031[0;47m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'
userdeladebian = "leo"
echo $userdeladebian

if [ "$(id -u)" != 0 ]; then
  echo -e "${RED}Tu n'es pas en root :'(${NC}"
  exit 2
fi
while :
do
echo -e "
${GREEN}---Menu du Script---${NC}

${BLUE} 1- Update/Upgrade & installation des paquets.${NC}
${BLUE} 2- Configuration de la BDD.${NC}
${BLUE} 3- L'api ruby, et l'api discord.${NC}
${BLUE} 4- Quitter le script et reboot de la machine --->[].${NC}

${GREEN}--------------------${NC}
"
#stty -echo #cacher l'affichage des iputs à l'écran
read chx_menu
stty echo

if [ $chx_menu = 1 ]; then # test si le numéro 1 est sélectionner.
  echo -e "${BLUE}1- Update/Upgrade & installation des paquets.${NC}" 
  yum -y update
  yum -y upgrade
  #Installation du paquet MariaDB
  echo -e "${GREEN}Update/Upgrade effectués${NC}"
  yum install wget -y 
  echo -e "${GREEN}Paquet Wget installé${NC}"
  echo -e "${GREEN}Installation de MariaDB${NC}"
  #Installation du paquet MariaDB
  yum install mariadb-server 
  echo -e "${GREEN}Paquet MariaDB installé.${NC}"
elif [ $chx_menu = 2 ]; then # test si le numéro 1 est sélectionner.
  echo -e "${GREEN}---Configuration de MariaDB---${NC}"
  systemctl start mariadb.service #Lance le système MariaDB
  systemctl enable mariadb.service #Active MariaDB a chaque démarrage de la machine
  firewall-cmd --add-port=3306/tcp 
  firewall-cmd --permanent --add-port=3306/tcp 
  mysql -u root -e "create user adminbot;" #Creation de l'user 'Adminbot'
  mysql -u root -e "create database tutorat;" #Création de la BDD tutorat
  mysql -u root -p tutorat < tutoratrefonte.sql #Import du script SQl dans la base de données tutoratrefonte.sql
  mysql -u root -e "GRANT ALL privileges ON tutorat.* TO adminbot;" #Ajouts des privilèges de adminbot
  echo -e "${GREEN}---- Voila MariaDB est configurée ! Félicitations !"
elif [ $chx_menu = 3 ]; then # test si le numéro 3 est sélectionner.
  yum install ruby-full -y # installation de ruby
  echo -e "${GREEN}Ruby installe.${NC}"
  git clone https://github.com/Slinah/api-refonte-tutorat.git # on clone l'api de notre bot
  echo -e "${GREEN}L'API ruby a été clone.${NC}"
  gem install bundler
  su -l leo -c " bundle install"
  apt install libssl-dev libffi-dev libsqlite3-dev zlib1g-dev gcc g++ make
  wget https://www.python.org/ftp/python/3.8.5/Python-3.8.5.tgz #modifier et mise a jour de python 3.8
  echo -e "${GREEN}Python est installé.${NC}"
  tar xzvf Python-3.8.5.tgz
  cd Python-3.8.5/
  ./configure
  make
  make install
  echo -e "${GREEN}Python OK.${NC}"
  wget https://bootstrap.pypa.io/get-pip.py #install pip
  yum upgrade get-pip.py #upgrade pip a test
  python3 -m pip install -U discord.py[voice] #s'intall parfaitement
  echo -e "${GREEN}L'API Discord.py a été cloné.${NC}"
  mkdir bot
  cd bot
  git clone https://github.com/Slinah/stage_refonte_bot.git
  echo -e "${GREEN}Le bot a été cloné.${NC}"
  sudo systemctl start python3 bot.py #Lance le système du bot
  sudo systemctl enable python3 bot.py #Active le bot a chaque démarrage de la machine
  cd
  #sudo systemctl start  #Lance le système de l'api ruby
  #sudo systemctl enable  #Active l'api ruby a chaque démarrage de la machine'
elif [ $chx_menu = 4 ]; then # test si le numéro 4 est sélectionner.
  echo "${RED}Tu nous quittes :/${NC}"
  reboot
  exit 1
fi
done

