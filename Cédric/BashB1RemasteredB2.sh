#!/bin/bash

MARRON='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

pause (){
    echo -e "${GREEN}Appuyer sur une touche ${NC}"
    read -p "$*"
}

[[ "$(id -u)" != "0" ]] && {
    echo -e "${RED}Tu n'es pas en root :'(${NC}"
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

[[ $chx_menu -eq 1 ]] && { // if choix menu
    echo -e "${MARRON}1- Update/Upgrade & installation des paquets.${NC}" 
    debian=$(grep "Debian" /etc/issue | cut -c1-6)
    [[ $debian -eq Debian ]] && {
        echo -e "${GREEN}Tu as Debian !${NC}"
        echo -e "${GREEN}Programme d'installation de Debian :)${NC}"
        debxport=$(grep "export maccent" /etc/bash.bashrc | cut -c8-14 | head -n 1)
        [[ $debxport -eq maccent ]] && {
            command > /dev/null 2>&1
        } || { // else
            echo "#~~Variables~~#
            export maccent=00:17:A4:4E:7B:7B
            export usercent=jules
            export ipcent=172.16.60.1
            export userdeladebian=$(users | grep -i "cedric")
            export ipdeladebian=172.16.60.5" >> /etc/bash.bashrc
            source /etc/bash.bashrc
        }
        cd /etc
        echo "webb1c2g4" > hostname 
        cd /etc/apt/ 
        echo "deb http://deb.debian.org/debian/ stable main contrib non-free
        deb-src http://deb.debian.org/debian/ stable main contrib non-free

        deb http://deb.debian.org/debian/ stable-updates main contrib non-free
        deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free" > sources.list

        echo -e "${GREEN}Les sources ont été modifiées (t'es maintenant sûr de pouvoir installer).${NC}"
        apt-get update -y --force-yes 
        apt-get upgrade -y --force-yes
        echo -e "${GREEN}Update/Upgrade effectués${NC}"
        echo -e "${GREEN}La tu es sur le point d'installer des trucs !${NC}"
        apt-get install openssh-server -y --force-yes
        echo -e "${GREEN}Paquet SSH installé.${NC}"
        apt-get install vsftpd -y --force-yes
        echo -e "${GREEN}Paquet FTP installé.${NC}"
        cd /etc
        [[ -d "/etc/vsftpd.conf" ]] && {
            rm /etc/vsftpd.conf
        }
        touch /etc/vsftpd.conf 
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
        apt-get install curl -y --force-yes
        echo -e "${GREEN}Paquet curl installé.${NC}"
        apt-get install apache2 -y --force-yes
        echo -e "${GREEN}Paquet Apache installé.${NC}"
        apt-get install php7.0 -y --force-yes
        echo -e "${GREEN}Paquet PHP7 installé.${NC}"
        apt-get install php -y --force-yes
        echo -e "${GREEN}Paquet PHP installé.${NC}"
        apt-get install php-mysql -y --force-yes
        echo -e "${GREEN}Paquet PHP-MySQL installé.${NC}"
        cd /home/$userdeladebian
        [[ -d "/home/$userdeladebian/.ssh/" ]] && {
            command > /dev/null 2>&1
            echo -e "${GREEN}Répertoire .ssh/ déjà crée.${NC}"
        } || {
            su -l $userdeladebian -c "mkdir .ssh/"
            echo -e "${GREEN}Répertoire .ssh/ crée.${NC}"
        }
        cd ./ssh
        [[ -d "/home/$userdeladebian/.ssh/authorized_keys" ]] && {
            command > /dev/null 2>&1
            echo -e "${GREEN}Fichier authorized_keys déjà crée.${NC}"
        } || {
            touch authorized_keys
            echo -e "${GREEN}Fichier authorized_keys crée.${NC}"
        }
        chmod 755 -R /home/$userdeladebian/.ssh/
    }
    echo -e "${GREEN}Tu as CentOS !${NC}"
    echo -e "${GREEN}Programme d'installation de CentOS :)${NC}"
    centxport=$(grep "export macdeb" /etc/bashrc | cut -c8-13)
    [[ $centxport -eq maceb ]] && {
        command > /dev/null 2>&1
    } || {
        echo "#~~Variables~~#
        export macdeb=00:17:A4:4E:79:A4
        export userdeb=cedric
        export ipdeb=172.16.60.5
        export userdeladecent=$(users | grep -i "jules")
        export ipdelacent=172.16.60.1" >> /etc/bashrc
        source /etc/bashrc
    }
    cd /etc
    echo "bddb1c2g4" > hostname
    yum -y update
    yum -y upgrade
    echo -e "${GREEN}Update/Upgrade effectués${NC}"
    echo -e "${GREEN}La tu es sur le point d'installer des trucs !${NC}"
    yum -y install nano
    echo -e "${GREEN}Nano installé.${NC}"
    yum -y install openssh-clients
    echo -e "${GREEN}Paquet SSH installé.${NC}"
    yum -y install vsftpd
    echo -e "${GREEN}Paquet FTP installé.${NC}"
    firewall-cmd --permanent --add-port=21/tcp
    firewall-cmd --permanent --add-service=ftp
    firewall-cmd --reload
    cd /etc
    [[ -d "/etc/vsftpd/vsftpd.conf" ]] && {
        rm /etc/vsftpd/vsftpd.conf
    }
    touch /etc/vsftpd/vsftpd.conf
    echo "anonymous_enable=NO
    local_enable=YES
    write_enable=YES
    local_umask=022
    dirmessage_enable=YES
    xferlog_enable=YES
    connect_from_port_20=YES
    xferlog_std_format=YES
    chroot_local_user=YES
    listen=NO
    listen_ipv6=YES
    pam_service_name=vsftpd
    userlist_enable=YES
    tcp_wrappers=YES
    allow_writeable_chroot=YES" > /etc/vsftpd/vsftpd.conf
    systemctl enable vsftpd.service
    setbool -P ftp_home_dir on
    systemctl restart vsftpd
    yum -y install curl
    echo -e "${GREEN}Paquet curl installé.${NC}"
    yum -y install mariadb-server
    echo -e "${GREEN}Paquet MariaDB installé.${NC}"
    cd /home/$userdeladecent
    [[ -d "/home/$userdeladecent/.ssh/" ]] && {
      command > /dev/null 2>&1
      echo -e "${GREEN}Répertoire .ssh/ déjà crée.${NC}"
    } || {
      su -l $userdeladecent -c "mkdir .ssh/"
      echo -e "${GREEN}Répertoire .ssh/ crée.${NC}"
    }
    cd .ssh/
    [[ -d "/home/$userdeladecent/.ssh/authorized_keys" ]] && {
        command > /dev/null 2>&1
        echo -e "${GREEN}Fichier authorized_keys déjà crée.${NC}"
    } || {
        touch authorized_keys
        echo -e "${GREEN}Fichier authorized_keys crée.${NC}"
    }
    chmod 755 -R /home/$userdeladecent/.ssh/
} || [[ $chx_menu -eq 2 ]] && {
    echo -e "${MARRON}2- Création d'utilisateurs.${NC}"
    [[ $debian = Debian ]] &&{
        [[ grep -i "adminweb" /etc/passwd ]] && {
            userweb=1
            echo -e "${MARRON}L'utilisateur est déjà présent.${NC}"
        } || {
            userweb=0
            echo -e "${RED}L'utilisateur n'a pas été créer, vous allez le créer.${NC}"
        }
        [[ $userweb -eq 0 ]] && {
            adduser adminweb 
            echo -e "${GREEN}Utilisateur adminweb crée.${NC}"
        }
        unset userweb
    } || {
        [[ grep -i "adminbdd" /etc/passwd ]] && {
            userbdd=1
            echo -e "${MARRON}L'utilisateur est déjà présent.${NC}"
        } || {
            userbdd=0
            echo -e "${RED}L'utilisateur n'a pas été créer, vous allez le créer.${NC}"
        }
        [[ $userbdd -eq 0 ]] && {
            adduser adminbdd
            passwd adminbdd
            echo -e "${GREEN}Utilisateur adminbdd crée.${NC}"
        }
        unset userbdd
    }
} || [[ $chx_menu -eq 3 ]] && {
    echo -e "${MARRON}3- SSH.${NC}"
    [[ $debian -eq Debian ]] && {
        [[ $debian -eq Debian ]] && {
            chown -R $userdeladebian /home/$userdeladebian/.ssh/ 
            su -l $userdeladebian -c "ssh-keygen -t rsa" 
            echo -e "${GREEN}Clefs générées.${NC}"
            ssh-copy-id -i /home/$userdeladebian/.ssh/id_rsa.pub $usercent@$ipcent 
            echo -e "${GREEN}Clefs copiées.${NC}"
        } || {
            chown -R $userdeladecent /home/$userdeladecent /.ssh/ 
            su -l $userdeladecent -c "ssh-keygen -t rsa"
            echo -e "${GREEN}Clefs générées.${NC}"
            ssh-copy-id -i /home/$userdeladecent/.ssh/id_rsa.pub $userdeb@$ipdeb 
            echo -e "${GREEN}Clefs copiées.${NC}"
        }
    }
} || [[ $chx_menu -eq 4 ]] && {
    echo -e "${MARRON}4- MariaDB.${NC}"
    [[ $debian -eq Debian ]] && {
        command > /dev/null 2>&1
    } || {
        echo -e "${GREEN}---Configuration de MariaDB---${NC}"
        yum install mariadb-server 
        sudo systemctl start mariadb 
        sudo systemctl enable mariadb 
        firewall-cmd --add-port=3306/tcp 
        firewall-cmd --permanent --add-port=3306/tcp 
        mysql -u root -e "create user adminbdd;" 
        mysql -u root -e "create database marcachat;" 
        mysql -u root -p marcachat < marcachatfinal.sql 
        echo -e "${RED}Avant de CONTINUER !!!!${NC} transferer le fichier 'index.php' et donner la localisation de l'erreur d'accès"
        read location
        mysql -u root -e "GRANT ALL privileges ON marcachat.* TO 'adminbdd'@'$location';" 
        echo -e "${GREEN}---- Voila MariaDB est configurée ! Félicitations ! A vous la joi des requetes ${RED}SANS CONCATENATION ! "
    }
} || [[ $chx_menu -eq 5 ]] && {
    echo -e "${RED}Tu nous quittes :c${NC}"
    reboot
}
done