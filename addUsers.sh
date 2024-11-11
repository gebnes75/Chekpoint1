#!/bin/bash
# Script création de compte 
echo "Users à créer :" $@

if [ "$#" -eq 0 ] 
then

    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

if cat /etc/passwd | grep $@
then
    # le compte $newUser existe
    # affichage message + sortie de script
    echo -e "L'utilisateur $@ existe déja"
    exit 1
else
    #le compte $newUser n'existe pas
    # affichage message + création du compte
    echo "Création utilisateur $@"
    sudo useradd $@ > /dev/null
    #verification création du compte
    if cat /etc/passwd | grep $@ > /dev/null
    then
        #le compte $newUser existe ==> compte existant OK
        # ajouter des infos
        echo "L'utilisateur $@ a été crée !"
    else
        #le compte $newUser n'existe pas ==> message erreur"
        echo "Erreur à la création de l'utilisateur $@."
    fi
fi
exit 0
