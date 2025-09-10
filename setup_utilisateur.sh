#!/bin/bash

# === Configuration ===
UTILISATEUR="etu"
MOTDEPASSE="btsciel2025"
UTILISATEURS_AUTORISES=("root" "$UTILISATEUR")  # Liste blanche

echo "=============================="
echo "Script de configuration RPi"
echo "=============================="
echo ""

# Vérifie si l'utilisateur existe
if id "$UTILISATEUR" &>/dev/null; then
  echo "L'utilisateur '$UTILISATEUR' existe déjà."
else
  echo "Création de l'utilisateur '$UTILISATEUR'..."
  sudo adduser --disabled-password --gecos "" "$UTILISATEUR"
  echo "$UTILISATEUR:$MOTDEPASSE" | sudo chpasswd
  sudo usermod -aG sudo "$UTILISATEUR"
  echo "Utilisateur '$UTILISATEUR' créé et ajouté à sudo."
fi

# Activation de SSH
echo ""
echo "Activation du service SSH..."
sudo systemctl enable ssh
sudo systemctl start ssh
echo "SSH est actif."

# Suppression des utilisateurs non autorisés
echo ""
read -p "Voulez-vous supprimer les anciens utilisateurs non autorisés ? (y/n) : " REP
if [[ "$REP" == "y" ]]; then
  echo "Recherche des utilisateurs à supprimer..."

  # Liste tous les utilisateurs avec un /home
  for u in $(awk -F: '$3 >= 1000 && $1 != "nobody" { print $1 }' /etc/passwd); do
    if [[ ! " ${UTILISATEURS_AUTORISES[@]} " =~ " $u " ]]; then
      echo "Suppression de l'utilisateur '$u'..."
      sudo deluser --remove-home "$u"
    else
      echo "Utilisateur '$u' conservé."
    fi
  done
else
  echo "Aucun utilisateur supprimé."
fi

echo ""
echo "Configuration terminée. Vous pouvez maintenant vous connecter avec :"
echo "ssh $UTILISATEUR@raspberrypi.local (mot de passe : $MOTDEPASSE)"