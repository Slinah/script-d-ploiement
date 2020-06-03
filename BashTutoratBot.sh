 #!/bin/bash

RED='\033[0;32m'
JAUNE='\033[0;0m'
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

${BLUE}1- Update/Upgrade & installation des paquets.
2- Création d'utilisateurs.
3- Openssh, et MariaDB.
4- Configuration de la BDD.
5- Quitter le script --->[].${NC}"
stty -echo #cacher l'affichage des iputs à l'écran
read chx_menu
stty echo

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
elif [ $chx_menu = 5 ]; then # test si le numéro 5 est sélectionner.
  echo -e "${RED}Tu nous quittes :c${NC}"
  reboot
  #exit 1
fi
done

