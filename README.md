# raspberrypi-init-etudiants

## Raspberry Pi - Initialisation

Ce dépôt contient un script shell pour configurer rapidement un Raspberry Pi à destination d'étudiants en BUT Informatique.

## Objectifs
- Créer un utilisateur `etu` avec mot de passe prédéfini
- Ajouter les droits `sudo`
- Activer SSH
- Supprimer les anciens comptes inutiles
- Vérifier la configuration

## 📂 Contenu du dépôt

| Fichier                  | Rôle                                             |
|--------------------------|--------------------------------------------------|
| `setup_utilisateur.sh`   | Script principal de configuration                |
| `check_postinstall.sh`   | Script de vérification post-installation         |
| `instructions.txt`       | Étapes à suivre pour exécuter le script          |
| `docs/`                  | (optionnel) Ressources complémentaires           |

## Instructions rapides

1. Cloner ou télécharger ce dépôt :

```bash
git clone https://github.com/boudjelaba/raspberrypi-init-etudiants.git
cd raspberrypi-init-etudiants
````

2. Rendre le script exécutable :

```bash
chmod +x setup_utilisateur.sh
```

3. Lancer la configuration :

```bash
./setup_utilisateur.sh
```

4. Vérifier ensuite :

```bash
./check_postinstall.sh
```

### Astuce

Vous pouvez copier ce dépôt sur une clé USB ou une carte SD pour une utilisation hors ligne.

### Auteur

Projet pédagogique proposé par \[K.B. / github.com/boudjelaba].
