#!/bin/bash

# Variables
REPO_URL="https://github.com/Wanhao-France/WanhaoKlipperAPI.git"
LOCAL_PATH="${HOME}/wanhaoklipperpadapi"
CURRENT_USER=${USER}

# Functions
status_msg() {
  echo
  echo -e "\e[96m###### $1\e[39m"
}

error_msg() {
  echo
  echo -e "\e[91m###### ERREUR : $1\e[39m"
  exit 1
}

# Check if the repository is already cloned
if [ -d "${LOCAL_PATH}" ]; then
  status_msg "Le dépôt existe déjà. Essayons de le mettre à jour..."

  # Try to pull the latest changes
  cd "${LOCAL_PATH}"
  git pull origin main
  if [ $? -ne 0 ]; then
    error_msg "Échec de la mise à jour du dépôt. Veuillez vérifier manuellement."
  else
    status_msg "Mise à jour réussie du dépôt."
  fi

else
  status_msg "Clonage du dépôt..."

  # Clone the repository
  git clone "${REPO_URL}" "${LOCAL_PATH}"
  if [ $? -ne 0 ]; then
    error_msg "Échec du clonage du dépôt. Veuillez vérifier manuellement."
  else
    status_msg "Clonage réussi du dépôt."
  fi
fi
