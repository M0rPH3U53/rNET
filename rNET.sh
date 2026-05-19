#!/bin/bash

# Banniere
cat <<"EOF"
                                               
░       ░░░   ░░░  ░░        ░░        ░
▒  ▒▒▒▒  ▒▒    ▒▒  ▒▒  ▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒
▓       ▓▓▓  ▓  ▓  ▓▓      ▓▓▓▓▓▓▓  ▓▓▓▓
█  ███  ███  ██    ██  ███████████  ████
█  ████  ██  ███   ██        █████  ████                                                
                                                
by M0rPH3U53

EOF

# Couleur ASSCI
BLEU='\033[34m'
ROUGE='\033[0;31m'
VERT='\033[0;32m'
GRIS='\033[0;90m'
RESET='\033[0m'
BLANC='\033[1;37m'
JAUNE='\033[0;33m'

# Adresse réseau + CIDR
IP=$(ip route | grep -E '^[0-9]' | awk '{print $1}')

echo " "
echo -e "${VERT}[+]${RESET} ${BLANC}Réseaux disponible${RESET} "
echo " "
echo "${IP}"
echo " "

# Interfaces réseaux
echo -ne "${BLEU}[i]${RESET} ${BLANC}Network:${RESET} "
read network

# Découverte réseau
echo " "
echo -ne "🔍 ${BLANC}Scan ARP...${RESET}"
hotes=$(netdiscover -r ${network} -P | grep -E '[0-9]+\.' | awk '{print $1}')
echo -e "${JAUNE}100%${RESET}"

# Verifie si la variable est vide
if [ -z "${hotes}" ]; then
    echo "❌ Aucun hote"
    exit 1
fi

# Recupere les IPs
echo " "
echo -ne "${VERT}[+]${RESET} ${BLANC}Hotes${RESET}"
echo " "
echo " "
for hote in ${hotes}; do
     echo "✅ ${hote}"
done

# Compte le nombre d'IP
echo " "
nb=$(echo "${hotes}" | wc -l)
echo -ne "${VERT}[+]${RESET} ${BLANC}Total:${RESET} ${nb}"
echo " "


