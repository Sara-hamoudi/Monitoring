#!/bin/bash

cmd=(dialog --keep-tite --menu "Select options:" 60 80 60)
while true;
do

options=(
1 "Voir les infos CPU"
2 "PID et nom des processus"
3 "Espace disque du système de fichiers"
4 "Informations sur l’espace disque du système de fichiers"
5 "Espace disque au format lisible par l’homme"
6 "Informations sur le système de fichiers en Mégaoctets"
7 "Type de système de fichiers"
8 "Espace RAM"
9 "Tous les ports réseau"
10 "Table de routage"
11 "Liste des interfaces réseau"
12 "Toutes les propriétés système"
13 "Toutes les propriétés logiciel"
14 "Lister les mises à jour"
15 "Donne la liste complète sur les processus"
16 "Affiche les procesus qui nont pas de terminal de controle"
17 "Affichez tous les processus au format BSD"
18 "Afficher les processus parent et enfant"
19 "Presenter le nom de lutilisateur et lheure de lancement"
20 "Afficher les informations detailles sur les processus"
21 "Afficher le nom de lutilisateur et le domaine"
22 "Voir les 63 derniere connexion utilisateurs"
23 "Affichez chaque processus actif sur un systeme Linux au format generique"
24 "Afficher le UID et GID des utilisateurs"
25 "Afficher les processus en cours d'exécution sur le système"
26 "Quitter"
)


choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
    case $choice in
      1)

      # define counting variable
      let i=0
      # define working array
      W=()
      # process file by file
      while read -r line; do
          let i=$i+1
          W+=($i "$line")
      done < <(lscpu)
      # show dialog and store output
      FILE=$(dialog --title "Infos CPU" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
        ;;

        2)

        # define counting variable
        let i=0
        # define working array
        W=()
        # process file by file
        while read -r line; do
            let i=$i+1
            W+=($i "$line")
        done < <(netstat -p)
        # show dialog and store output
        FILE=$(dialog --title "PID et nom des processus" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
          ;;

          3)

          # define counting variable
          let i=0
          # define working array
          W=()
          # process file by file
          while read -r line; do
              let i=$i+1
              W+=($i "$line")
          done < <(df)
          # show dialog and store output
          FILE=$(dialog --title "Espace disque du système de fichiers" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
            ;;

            4)

            # define counting variable
            let i=0
            # define working array
            W=()
            # process file by file
            while read -r line; do
                let i=$i+1
                W+=($i "$line")
            done < <(df -a)
            # show dialog and store output
            FILE=$(dialog --title "Informations sur l’espace disque du système de fichiers" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
              ;;

              5)

              # define counting variable
              let i=0
              # define working array
              W=()
              # process file by file
              while read -r line; do
                  let i=$i+1
                  W+=($i "$line")
              done < <(df -h)
              # show dialog and store output
              FILE=$(dialog --title "Espace disque au format lisible par l’homme" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                ;;

                6)

                # define counting variable
                let i=0
                # define working array
                W=()
                # process file by file
                while read -r line; do
                    let i=$i+1
                    W+=($i "$line")
                done < <(df -m)
                # show dialog and store output
                FILE=$(dialog --title "Informations sur le système de fichiers en Mégaoctets" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                  ;;

                  7)

                  # define counting variable
                  let i=0
                  # define working array
                  W=()
                  # process file by file
                  while read -r line; do
                      let i=$i+1
                      W+=($i "$line")
                  done < <(df -T)
                  # show dialog and store output
                  FILE=$(dialog --title "Type de système de fichiers" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                    ;;

                    8)

                    # define counting variable
                    let i=0
                    # define working array
                    W=()
                    # process file by file
                    while read -r line; do
                        let i=$i+1
                        W+=($i "$line")
                    done < <(cat /proc/meminfo)
                    # show dialog and store output
                    FILE=$(dialog --title "Informations RAM" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                      ;;

                      9)

                      # define counting variable
                      let i=0
                      # define working array
                      W=()
                      # process file by file
                      while read -r line; do
                          let i=$i+1
                          W+=($i "$line")
                      done < <(netstat)
                      # show dialog and store output
                      FILE=$(dialog --title "Tous les ports réseau" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                        ;;


      10)

      # define counting variable
      let i=0
      # define working array
      W=()
      # process file by file
      while read -r line; do
          let i=$i+1
          W+=($i "$line")
      done < <(netstat -r)
      # show dialog and store output
      FILE=$(dialog --title "Table de routage" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
        ;;

        11)

        # define counting variable
        let i=0
        # define working array
        W=()
        # process file by file
        while read -r line; do
            let i=$i+1
            W+=($i "$line")
          done < <(netstat -i)
        #done < <(netstat -ie)
        # show dialog and store output
        FILE=$(dialog --title "Liste des interfaces réseau" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
          ;;

          12)

          # define counting variable
          let i=0
          # define working array
          W=()
          # process file by file
          while read -r line; do
              let i=$i+1
              W+=($i "$line")
          done < <(uname --all)
          # show dialog and store output
          FILE=$(dialog --title "Liste des propriétés système" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
            ;;

            13)

            # define counting variable
            let i=0
            # define working array
            W=()
            # process file by file
            while read -r line; do
                let i=$i+1
                W+=($i "$line")
            done < <(dpkg -l)
            # show dialog and store output
            FILE=$(dialog --title "Liste des propriétés logiciel" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
              ;;

              14)

              # define counting variable
              let i=0
              # define working array
              W=()
              # process file by file
              while read -r line; do
                  let i=$i+1
                  W+=($i "$line")
              done < <(cat /etc/apt/sources.list)
              # show dialog and store output
              FILE=$(dialog --title "Liste des mises à jour" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                ;;
                15)

                # define counting variable
                let i=0
                # define working array
                W=()
                # process file by file
                while read -r line; do
                    let i=$i+1
                    W+=($i "$line")
                done < <(ps -ef)
                # show dialog and store output
                FILE=$(dialog --title "Donne la liste complète sur les processus" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                  ;;
                  16)

                  # define counting variable
                  let i=0
                  # define working array
                  W=()
                  # process file by file
                  while read -r line; do
                      let i=$i+1
                      W+=($i "$line")
                  done < <(ps -x)
                  # show dialog and store output
                  FILE=$(dialog --title "Affiche les procesus qui nont pas de terminal de controle" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                    ;;
                    17)

                    # define counting variable
                    let i=0
                    # define working array
                    W=()
                    # process file by file
                    while read -r line; do
                        let i=$i+1
                        W+=($i "$line")
                    done < <(ps au)
                    # show dialog and store output
                    FILE=$(dialog --title "Affichez tous les processus au format BSD" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                      ;;
                      18)

                      # define counting variable
                      let i=0
                      # define working array
                      W=()
                      # process file by file
                      while read -r line; do
                          let i=$i+1
                          W+=($i "$line")
                      done < <(ps -C sshd)
                      # show dialog and store output
                      FILE=$(dialog --title "Afficher les processus parent et enfant" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                        ;;
                        19)

                        # define counting variable
                        let i=0
                        # define working array
                        W=()
                        # process file by file
                        while read -r line; do
                            let i=$i+1
                            W+=($i "$line")
                        done < <(ps u)
                        # show dialog and store output
                        FILE=$(dialog --title "Presenter le nom de lutilisateur et lheure de lancement" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                          ;;
                          20)

                          # define counting variable
                          let i=0
                          # define working array
                          W=()
                          # process file by file
                          while read -r line; do
                              let i=$i+1
                              W+=($i "$line")
                          done < <(ps -ef -f)
                          # show dialog and store output
                          FILE=$(dialog --title "Afficher les informations detailles sur les processus" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                            ;;
                            21)

                            # define counting variable
                            let i=0
                            # define working array
                            W=()
                            # process file by file
                            while read -r line; do
                                let i=$i+1
                                W+=($i "$line")
                            done < <(last w)
                            # show dialog and store output
                            FILE=$(dialog --title "Afficher le nom de lutilisateur et le domaine" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                              ;;
                              22)

                              # define counting variable
                              let i=0
                              # define working array
                              W=()
                              # process file by file
                              while read -r line; do
                                  let i=$i+1
                                  W+=($i "$line")
                              done < <(last -n 63)
                              # show dialog and store output
                              FILE=$(dialog --title "Voir les 63 derniere connexion utilisateurs" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                                ;;
                                23)

                                # define counting variable
                                let i=0
                                # define working array
                                W=()
                                # process file by file
                                while read -r line; do
                                    let i=$i+1
                                    W+=($i "$line")
                                done < <(ps -e)
                                # show dialog and store output
                                FILE=$(dialog --title "Affichez chaque processus actif sur un systeme Linux au format generique" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                                  ;;
                                  24)

                                  # define counting variable
                                  let i=0
                                  # define working array
                                  W=()
                                  # process file by file
                                  while read -r line; do
                                      let i=$i+1
                                      W+=($i "$line")
                                  done < <(cat /etc/passwd)
                                  # show dialog and store output
                                  FILE=$(dialog --title "Afficher le UID et GID des utilisateurs" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                                    ;;

                                    25)

                                    # define counting variable
                                    let i=0
                                    # define working array
                                    W=()
                                    # process file by file
                                    while read -r line; do
                                        let i=$i+1
                                        W+=($i "$line")
                                    done < <(ps)
                                    # show dialog and store output
                                    FILE=$(dialog --title "Afficher les processus en cours d'exécution sur le système" --menu " " 1000 1000 1000 "${W[@]}" 3>&2 2>&1 1>&3)
                                      ;;

        26)
          clear
          exit 0
          ;;
        esac
    done
done
