#!/bin/bash

# VITAL MADE THIS
group_names=(
    "gl_sources_l"
    "gl_compta_m"
    "gl_commun_m"
)
for group in "${group_names[@]}"; do
    groupdel "$group"
    groupadd "$group"
done
users=(
    "Tom:Tom Lavedas:HelloICT1"
    "ted:Ted David:HelloICT2"
    "linus:Linus Torvalds:HelloICT3"
    "alyn:Alyn Typewriter:HelloICT4"
    "cresus:Cresus Komtoa:HelloICT5"
    "bill:Bill Gate:HelloICT6"
)
for user_info in "${users[@]}"; do
    IFS=':' read -r username fullname password <<< "$user_info"
    userdel -r "$username"
    useradd -m -c "$fullname" "$username"
    echo "$username:$password" | chpasswd
    usermod -aG gl_commun_m "$username"
done
usermod -aG gl_sources_l ted
usermod -aG gl_sources_l bill
usermod -aG gl_compta_m linus
usermod -aG gl_compta_m alyn
# VITAL PART ENDS HERE

# Delete OLD
rmdir /home/exercices/compta
rmdir /home/exercices/sources
rmdir /home/exercices/commun

# Make new files and give permissions
mkdir /home/exercices/compta
mkdir /home/exercices/sources
mkdir /home/exercices/commun

chown :gl_commun_m /home/exercices/commun
chmod g+rw /home/exercices/commun
chown :gl_sources_l /home/exercices/sources
chmod g+r /home/exercices/sources
chown :gl_compta_m /home/exercices/compta
chmod g+rw /home/exercices/compta
