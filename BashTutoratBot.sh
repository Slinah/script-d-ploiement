 #command to execute it on debian chmod +x .sh
 #!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ "$(id -u)" != "0" ]; then
  echo "${RED}Tu n'es pas en root :'(${NC}"
  exit 1
fi
while :
do
echo "
${GREEN}---Menu du Script---${NC}

${BLUE}1- Update/Upgrade & installation des paquets.${NC}
${BLUE}2- Création d'utilisateurs.${NC}
${BLUE}3- Openssh, et l'api ruby.${NC}
${BLUE}4- Configuration de la BDD.${NC}
${BLUE}5- Quitter le script et reboot de la machine --->[].${NC}

${GREEN}--------------------${NC}
"
#stty -echo #cacher l'affichage des iputs à l'écran
read chx_menu
stty echo

if [ $chx_menu = 1 ]; then # test si le numéro 1 est sélectionner.
  echo "${BLUE}1- Update/Upgrade & installation des paquets.${NC}" 
  debxport=$(grep "export maccent" /etc/bash.bashrc | cut -c8-14 | head -n 1)
  #stocke le résultat de la première ligne et des caractères 8 à 14 pour la recherche
  #"export maccent" du fichier bash.bashrc dans la variable debxport
  if [ $debxport = maccent ]; then #si debxport = maccent
    command > /dev/null 2>&1 #ne rien faire
    else #variable (certaine on servis pour des tests...)
       echo "#~~Variables~~#
export maccent=00:17:A4:4E:7B:7B
export usercent=adminBot
export ipcent=172.16.60.1
export userdeladebian=$(users | grep -i "leo")" >> /etc/bash.bashrc
      source /etc/bash.bashrc #actualiser le fichier bash.bashrc
  fi
     cd /etc
  echo "tutoratBot" > hostname #changer le nom de la machine
  cd /etc/apt/ #mise a jour des sources
  echo "deb http://deb.debian.org/debian/ stable main contrib non-free
  deb-src http://deb.debian.org/debian/ stable main contrib non-free
  deb http://deb.debian.org/debian/ stable-updates main contrib non-free
  deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free" > sources.list
  echo "${GREEN}Les sources ont été modifiées (t'es maintenant sûr de pouvoir installer).${NC}"
  #Update upgrade des sources
  apt-get update -y --force-yes #update/upgrade
  apt-get upgrade -y --force-yes
  echo "${GREEN}Update/Upgrade effectués${NC}"
  echo "${GREEN}Installation de Openssh, et MariaDB ${NC}"
  #Installation du paquet SSH
  apt-get install openssh-server -y --force-yes
  echo "${GREEN}Paquet SSH installé.${NC}"
  #Installation du paquet FTP
  apt-get install vsftpd -y --force-yes
  echo "${GREEN}Paquet FTP installé.${NC}"
  cd /etc
  if [ -d "/etc/vsftpd.conf" ];then
    rm /etc/vsftpd.conf
  fi
  touch /etc/vsftpd.conf #changer le fichier vsftpd
  echo "listen=NO
  listen_ipv6=YES
  anonymous_enable=NO
  local_enable=YES
  write_enable=YES
  local_umask=022
  dirmessage_enable=YES
  use_localtime=YES
  xferlog_enable=YES
  connect_from_port_20=YES
  chroot_local_user=YES
  secure_chroot_dir=/var/run/vsftpd/empty
  pam_service_name=vsftpd
  rsa_cert_file=/etc/ssl/certs/ssl-cert-snakeoil.pem
  rsa_private_key_file=/etc/ssl/private/ssl-cert-snakeoil.key
  ssl_enable=NO
  allow_writeable_chroot=YES" > /etc/vsftpd.conf
  service restart vsftpd
  echo "${GREEN}Paquet MariaDB installé.${NC}"
    if [ -d "/home/$userdeladebian/.ssh/" ];then #si .ssh/ est deja créer, ne rien faire
    command > /dev/null 2>&1
    echo "${GREEN}Répertoire .ssh/ déjà crée.${NC}"
  else #si .ssh/ n'est pas créer, le créer
    su -l $userdeladebian -c "mkdir .ssh/"
    echo "${GREEN}Répertoire .ssh/ crée.${NC}"
  fi
  cd .ssh/
  if [ -d "/home/$userdeladebian/.ssh/authorized_keys" ];then #si authorized_keys est deja créer, ne rien faire
    command > /dev/null 2>&1
    echo "${GREEN}Fichier authorized_keys déjà crée.${NC}"
  else #si authorized_keys n'est pas créer, le créer
    touch authorized_keys
    echo "${GREEN}Fichier authorized_keys crée.${NC}"
  fi
  chmod 755 -R /home/$userdeladebian/.ssh/ #attribution des droits 755 a .ssh/
elif [ $chx_menu = 2 ]; then # test si le numéro 2 est sélectionner.
  echo "${BLUE}2- Création d'utilisateurs.${NC}"
  if grep -i "adminBot" /etc/passwd;then #test pour voir si l'user existe deja
    userweb=1
    echo "${BLUE}L'utilisateur est déjà présent.${NC}"
  else
    userweb=0
    echo "${RED}L'utilisateur n'a pas été créer, vous allez le créer.${NC}"
  fi
  if [ $userweb == 0 ]; then
    adduser adminBot #création de l'utilisateur
    echo "${GREEN}Utilisateur adminBot crée.${NC}"
  fi
  unset userweb
  if grep -i "adminBot" /etc/passwd;then
    userbdd=1
    echo "${BLUE}L'utilisateur est déjà présent.${NC}"
  else
    userbdd=0
    echo "${RED}L'utilisateur n'a pas été créer, vous allez le créer.${NC}"
  fi
  if [ $userbdd == 0 ]; then
    adduser adminBot
    passwd adminBot
    echo "${GREEN}Utilisateur adminBot crée.${NC}"
  fi
  unset userbdd
elif [ $chx_menu = 3 ]; then # test si le numéro 3 est sélectionner.
  echo "${BLUE}3- SSH.${NC}"
  chown -R $userdeladebian /home/$userdeladebian/.ssh/ #Attribution du dossier .ssh/ a l'user
  su -l $userdeladebian -c "ssh-keygen -t rsa" #génération des Clefs
  echo "${GREEN}Clefs générées.${NC}"
      ssh-copy-id -i /home/$userdeladebian/.ssh/id_rsa.pub $usercent@$ipcent #copies des clefs
    echo -e "${GREEN}Clefs copiées.${NC}"
  sudo apt install ruby-full # installation de ruby
  echo -e "${GREEN}Ruby installe.${NC}"
  git clone https://github.com/Slinah/api-refonte-tutorat.git # on clone l'api de notre bot
  echo -e "${GREEN}L'API a été clone.${NC}"
  sudo gem install bundler
  sudo bundle install
  sudo service 
elif [ $chx_menu = 4 ]; then # test si le numéro 4 est sélectionner.
  echo "${BLUE}4- MariaDB.${NC}"
  #Installation du paquet MariaDB
  apt-get install mariadb-server -y --force-yes
  command > /dev/null 2>&1
  echo "${GREEN}---Configuration de MariaDB---${NC}"
  sudo apt install mariadb-server #Installe MariaDB
  sudo systemctl start mariadb #Lance le système MariaDB
  sudo systemctl enable mariadb #Active MariaDB a chaque démarrage de la machine
  firewall-cmd --add-port=3306/tcp #Ouverture du port 3306
  firewall-cmd --permanent --add-port=3306/tcp #Ouverture permanente du port 3306
  mysql -u root "create user adminBot;" #Creation de l'user 'adminBot'
  mysql -u root "create database tutoratBot;" #Création de la BDD tutoratBot
  mysql -u root -p tutoratBot < tutorat.sql #Import du script SQl dans la base de données du tutorat
  #echo -e "${RED}Avant de CONTINUER !!!!${NC} transferer le fichier 'index.php' et donner la localisation de l'erreur d'accès"
  #read location
  echo "${GREEN}---- Voila MariaDB est configurée ! Félicitations !"
elif [ $chx_menu = 5 ]; then # test si le numéro 5 est sélectionner.
  echo "${RED}Tu nous quittes :c${NC}"
  #reboot
  exit 1
fi
done

