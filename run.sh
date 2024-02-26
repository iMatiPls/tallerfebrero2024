#!/bin/bash

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'

# Mensaje de introducción
clear
echo -e "${CYAN}=========================================================${NC}"
echo -e "${CYAN} _        _ _            __     _                         _____  _____  _____   ___ \n\
| |      | | |          / _|   | |                       / __  \\|  _  |/ __  \\ /   |\n\
| |_ __ _| | | ___ _ __| |_ ___| |__  _ __ ___ _ __ ___  \`' / /'| |/' |\`' / /'/ /| |\n\
| __/ _\` | | |/ _ \\ '__|  _/ _ \\ '_ \\| '__/ _ \\ '__/ _ \\   / /  |  /| |  / / / /_| |\n\
| || (_| | | |  __/ |  | ||  __/ |_) | | |  __/ | | (_) |./ /___\\ |_/ /./ /__\\___  |\n\
 \\__\\__,_|_|_|\\___|_|  |_| \\___|_.__/|_|  \\___|_|  \\___/ \\_____/ \\___/ \\_____/   |_/${NC}"
echo -e "${CYAN}=========================================================${NC}"
echo -e "${GREEN}Este Script ha sido diseñado con la intención de automatizar la inicialización de los servidores mediante la creación del usuario Ansible, la creación y distribución de clave SSH, además de la configuración de los permisos SUDO.${NC}"

echo -e "${GREEN}Continuará con el Update y configuración del Firewall en ellos, seguido de la instalación de Tomcat en contenedores Podman y la de Apache para funcionar de Reverse Proxy.${NC}"

echo -e "${YELLOW}\nPresiona enter para empezar el Script.${NC}"
read -rsp $''

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Function to install Ansible collection if not present
ensure_ansible_collection() {
    local collection_name="$1"
    echo -e "${BLUE}Comprobando la instalación de la colección ${BLUE}$collection_name...${NC}"
    if ansible-galaxy collection list | grep -q "$collection_name"; then
        echo -e "${GREEN}La colección ${BLUE}$collection_name${GREEN} ya está instalada.${NC}"
    else
        echo -e "${YELLOW}Instalando la colección ${BLUE}$collection_name${YELLOW}...${NC}"
        ansible-galaxy collection install "$collection_name"
    fi
}

echo -e "${BLUE}=============================================${NC}"
echo -e "${BLUE}Comprobando la instalación de Ansible...${NC}"
echo -e "${BLUE}=============================================${NC}"

# Check for Ansible installation
if ! command_exists ansible; then
    echo -e "${RED}Ansible no está instalado. Por favor, instálalo para continuar.${NC}"
    exit 1
else
    echo -e "${GREEN}Ansible está instalado.${NC}"
fi

echo -e "${BLUE}---------------------------------------------${NC}"
read -p "¿Deseas crear los usuarios Ansible y configurar la llave SSH en los servidores? (s/n): " -r answer
echo -e "${BLUE}---------------------------------------------${NC}"

if [[ $answer =~ ^[Ss]$ ]]; then
    # Ensure the community.crypto collection is installed
    ensure_ansible_collection "community.crypto"

    echo -e "${BLUE}---------------------------------------------${NC}"
    read -p "Ingresa el usuario con privilegios sudo a utilizar: " sudo_user
    echo -e "${BLUE}---------------------------------------------${NC}"

    if [ -z "$sudo_user" ]; then
        echo -e "${RED}No ingresaste un usuario. Abortando...${NC}"
        exit 1
    else
        echo -e "${GREEN}Se creará el usuario Ansible y se configurará la llave SSH en los servidores.${NC}"
        echo -e "${YELLOW}Por favor, ingresa la contraseña del usuario ${BLUE}$sudo_user${YELLOW} cuando se te solicite.${NC}"
        echo
        ansible-playbook -K -k -u "$sudo_user" ./playbooks/bootstrap.yml
        echo -e "${YELLOW}El playbook bootstrap se ha ejecutado, verifica si la ejecucion fue ${GREEN}exitosa ${YELLOW}o ${RED}fallida${YELLOW}.${NC}"
    fi
else
    echo -e "${RED}Operación cancelada por el usuario.${NC}"
fi

echo -e "${BLUE}---------------------------------------------${NC}"
read -p "¿Deseas ejecutar el playbook principal? (s/n): " -r answer
echo -e "${BLUE}---------------------------------------------${NC}"

if [[ ! $answer =~ ^[Ss]$ ]]; then
    echo -e "${RED}Operación cancelada por el usuario.${NC}"
    exit 0
fi

# Ensure the containers.podman collection is installed
ensure_ansible_collection "containers.podman"

# Execute the main playbook
echo
echo -e "${BLUE}=========================================================${NC}"
echo -e "${CYAN}             Ejecución del Playbook Principal            ${NC}"
echo -e "${BLUE}=========================================================${NC}"
ansible-playbook ./playbooks/main/main.yml
