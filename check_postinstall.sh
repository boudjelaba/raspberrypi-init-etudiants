#!/bin/bash

echo "=============================="
echo "Vérification post-install"
echo "=============================="
echo ""

# 1. Vérification utilisateur
if id "etu" &>/dev/null; then
  echo "Utilisateur 'etu' existe."
else
  echo "L'utilisateur 'etu' n'existe pas."
  exit 1
fi

# 2. Vérification sudo
if groups etu | grep -q "\bsudo\b"; then
  echo "'etu' est dans le groupe sudo."
else
  echo "'etu' n'a pas les droits sudo."
fi

# 3. Vérification SSH
if systemctl is-active --quiet ssh; then
  echo "SSH est activé."
else
  echo "SSH n'est pas actif."
  read -p "Souhaitez-vous l'activer maintenant ? (y/n) : " REP
  if [[ "$REP" == "y" ]]; then
    sudo systemctl enable ssh
    sudo systemctl start ssh
    echo "SSH activé."
  fi
fi

# 4. Vérification mot de passe (facultative)
read -p "Voulez-vous tester la connexion SSH locale à 'etu' ? (y/n) : " TEST
if [[ "$TEST" == "y" ]]; then
  su - etu -c "echo 'Connexion réussie en tant que etu'"
fi

echo ""
echo "Vérification terminée."