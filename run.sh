#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Function to install Ansible collection if not present
ensure_ansible_collection() {
    local collection_name="$1"
    if ansible-galaxy collection list | grep -q "$collection_name"; then
        echo "La colección $collection_name ya está instalada."
    else
        echo "Instalando la colección $collection_name..."
        ansible-galaxy collection install "$collection_name"
    fi
}

# Check for Ansible installation
if ! command_exists ansible; then
    echo "Ansible no está instalado. Por favor, instálalo para continuar."
    exit 1
else
    echo "Ansible está instalado."
fi

# Ask user about creating Ansible users and configuring SSH key
echo
read -p "¿Deseas crear los usuarios Ansible y configurar la llave SSH en los servidores? (s/n): " -r answer
echo

if [[ $answer =~ ^[Ss]$ ]]; then
    # Ensure the community.crypto collection is installed
    ensure_ansible_collection "community.crypto"

    # Ask for the sudo user
    read -p "Ingresa el usuario con privilegios sudo a utilizar: " sudo_user
    echo

    if [ -z "$sudo_user" ]; then
        echo "No ingresaste un usuario. Abortando..."
        exit 1
    else
        echo "Se creará el usuario Ansible y se configurará la llave SSH en los servidores."
        echo "Por favor, ingresa la contraseña del usuario $sudo_user cuando se te solicite."
        echo
        ansible-playbook -K -k -u "$sudo_user" ./playbooks/bootstrap.yml
    fi
else
    echo "Operación cancelada por el usuario."
fi

# Ask user about starting the main playbook
echo
read -p "¿Deseas ejecutar el playbook principal? (s/n): " -r answer
echo

if [[ ! $answer =~ ^[Ss]$ ]]; then
    echo "Operación cancelada por el usuario."
    exit 0
fi

# Ensure the containers.podman collection is installed
ensure_ansible_collection "containers.podman"

# Execute the main playbook
echo "Ejecutando playbook principal..."
ansible-playbook ./playbooks/main/main.yml
