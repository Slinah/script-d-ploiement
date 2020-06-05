 #command to execute it on debian chmod +x .sh
 #!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ "$(id -u)" != "0" ]; then
  echo -e "${RED}Tu n'es pas en root :'(${NC}"
  exit 1
fi
while :
do
echo -e "
${GREEN}---Menu du Script---${NC}

${BLUE}1- Update/Upgrade & installation des paquets.${NC}
${BLUE}2- Création d'utilisateurs.${NC}
${BLUE}3- Openssh, et MariaDB.${NC}
${BLUE}4- Configuration de la BDD.${NC}
${BLUE}5- Quitter le script et reboot de la machine --->[].${NC}

${GREEN}--------------------${NC}
"
#stty -echo #cacher l'affichage des iputs à l'écran
read chx_menu
stty echo

if [ $chx_menu = 1 ]; then # test si le numéro 1 est sélectionner.
  echo -e "${BLUE}1- Update/Upgrade & installation des paquets.${NC}" 
  echo -e "${GREEN}Tu as Debian !${NC}"
  echo -e "${GREEN}Programme d'installation de Debian :)${NC}"
  debxport=$(grep "export maccent" /etc/bash.bashrc | cut -c8-14 | head -n 1)
  #stocke le résultat de la première ligne et des caractères 8 à 14 pour la recherche
  #"export maccent" du fichier bash.bashrc dans la variable debxport
  if [ $debxport = maccent ]; then #si debxport = maccent
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
  echo -e "${GREEN}Installation de Openssh, et MariaDB{NC}"
  #Installation du paquet SSH
  apt-get install openssh-server -y --force-yes
  echo -e "${GREEN}Paquet SSH installé.{NC}"
  #Installation du paquet FTP
  apt-get install vsftpd -y --force-yes
  echo -e "${GREEN}Paquet FTP installé.${NC}"
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
  #Installation du paquet MariaDB
  apt-get install mariadb-server -y --force-yes
  echo -e "${GREEN}Paquet MariaDB installé.${NC}"
    if [ -d "/home/$userdeladebian/.ssh/" ];then #si .ssh/ est deja créer, ne rien faire
    command > /dev/null 2>&1
    echo -e "${GREEN}Répertoire .ssh/ déjà crée.${NC}"
  else #si .ssh/ n'est pas créer, le créer
    su -l $userdeladebian -c "mkdir .ssh/"
    echo -e "${GREEN}Répertoire .ssh/ crée.${NC}"
  fi
  cd .ssh/
  if [ -d "/home/$userdeladebian/.ssh/authorized_keys" ];then #si authorized_keys est deja créer, ne rien faire
    command > /dev/null 2>&1
    echo -e "${GREEN}Fichier authorized_keys déjà crée.${NC}"
  else #si authorized_keys n'est pas créer, le créer
    touch authorized_keys
    echo -e "${GREEN}Fichier authorized_keys crée.${NC}"
  fi
  chmod 755 -R /home/$userdeladebian/.ssh/ #attribution des droits 755 a .ssh/
  fi
elif [ $chx_menu = 2 ]; then # test si le numéro 2 est sélectionner.
  echo -e "${BLUE}2- Création d'utilisateurs.${NC}"
  if [[ $debian = Debian ]]; then #si l'OS est debian
    if grep -i "adminweb" /etc/passwd;then #test pour voir si l'user existe deja
      userweb=1
      echo -e "${BLUE}L'utilisateur est déjà présent.${NC}"
    else
      userweb=0
      echo -e "${RED}L'utilisateur n'a pas été créer, vous allez le créer.${NC}"
    fi
    if [ $userweb == 0 ]; then
      adduser adminweb #création de l'utilisateur
      echo -e "${GREEN}Utilisateur adminweb crée.${NC}"
    fi
    unset userweb
  else
    if grep -i "adminbdd" /etc/passwd;then
      userbdd=1
      echo -e "${BLUE}L'utilisateur est déjà présent.${NC}"
    else
      userbdd=0
      echo -e "${RED}L'utilisateur n'a pas été créer, vous allez le créer.${NC}"
    fi
    if [ $userbdd == 0 ]; then
      adduser adminbdd
      passwd adminbdd
      echo -e "${GREEN}Utilisateur adminbdd crée.${NC}"
    fi
    unset userbdd
  fi
elif [ $chx_menu = 3 ]; then # test si le numéro 3 est sélectionner.
  echo -e "${BLUE}3- SSH.${NC}"
  if [[ $debian = Debian ]]; then
    chown -R $userdeladebian /home/$userdeladebian/.ssh/ #Attribution du dossier .ssh/ a l'user
    su -l $userdeladebian -c "ssh-keygen -t rsa" #génération des Clefs
        echo -e "${GREEN}Clefs générées.${NC}"
  fi
elif [ $chx_menu = 4 ]; then # test si le numéro 4 est sélectionner.
  echo -e "${BLUE}4- MariaDB.${NC}"
  if [[ $debian == Debian ]]; then
    command > /dev/null 2>&1
  else #Cette partie n'est pas sensée se lancer sous debian, mais elle passe outre le test précédant
    echo -e "${GREEN}---Configuration de MariaDB---${NC}"
    yum install mariadb-server #Installe MariaDB
    sudo systemctl start mariadb #Lance le système MariaDB
    sudo systemctl enable mariadb #Active MariaDB a chaque démarrage de la machine
    firewall-cmd --add-port=3306/tcp #Ouverture du port 3306
    firewall-cmd --permanent --add-port=3306/tcp #Ouverture permanente du port 3306
    mysql -u root -e "create user adminbdd;" #Creation de l'user 'Adminbdd'
    mysql -u root -e "create database tutoratBot;" #Création de la BDD marcachat
    #mysql -u root -p marcachat < marcachatfinal.sql #Import du script SQl dans la base de données Marcachat
    #echo -e "${RED}Avant de CONTINUER !!!!${NC} transferer le fichier 'index.php' et donner la localisation de l'erreur d'accès"
    #read location
    echo -e "${GREEN}---- Voila MariaDB est configurée ! Félicitations ! A vous la joi des requetes ${RED}SANS CONCATENATION ! "
  fi
elif [ $chx_menu = 5 ]; then # test si le numéro 5 est sélectionner.
  echo -e "${RED}Tu nous quittes :c${NC}"
  #reboot
  exit 1
fi
done

