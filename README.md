---

# 🚀 Taller Febrero 2024

## 📌 Descripción

Este repositorio 📂 es el núcleo de un proyecto diseñado para automatizar la configuración de un entorno de desarrollo utilizando Ansible. Desarrollado por Matías López e Ignacio Lorenzo como parte de su trabajo final de universidad, este taller abarca la actualización de servidores, la instalación de OpenJDK y Tomcat 8 en contenedores usando Podman, y la configuración de un proxy reverso para acceder de manera segura y eficiente a la aplicación Java. Se espera que los servidores utilizados sean derivados de RHEL o Debian, tales como Rocky Linux o Ubuntu.

## 🛠 Configuración de Proyecto

El proyecto incluye las siguientes tareas clave, automatizadas mediante Ansible:

1. **Actualización de Servidores** 🔄: Garantiza que ambos servidores estén actualizados con las últimas versiones de seguridad y software.
2. **Instalación de OpenJDK y Tomcat 8 en Contenedores** ☕🐱: Configura un servidor con OpenJDK y Tomcat 8, desplegando la [aplicación de muestra de Tomcat](https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/) en contenedores gestionados por Podman.
3. **Configuración de Proxy Reverso** 🔄↩️: Establece un proxy reverso en el otro servidor para un acceso optimizado a la aplicación Java.

## 🗂 Estructura del Repositorio

Este repositorio está organizado de la siguiente manera:

- `playbooks/`: Contiene los playbooks de Ansible necesarios para automatizar las tareas mencionadas.
- `run.sh`: Script para ejecutar el proyecto, facilitando el proceso de despliegue y configuración.

## 🚀 Cómo Iniciar

Sigue estos pasos para configurar tu entorno:

1. 📥 **Clonar el repositorio**: Comienza clonando este repositorio en tu máquina local.
2. 📋 **Preparativos**: Asegúrate de tener Ansible instalado y acceso a dos servidores (uno para la aplicación y otro para el proxy reverso), preferiblemente derivados de RHEL o Debian.
3. 🎛 **Configuración**: Revisa y ajusta los playbooks de Ansible de acuerdo a tus necesidades.
4. 🖥 **Ejecución**: Ejecuta `run.sh` para configurar tus servidores de manera automática.

## 📋 Requisitos

Para empezar, necesitarás:

- Ansible instalado en tu máquina local.
- Dos servidores accesibles para la configuración, basados en derivados de RHEL o Debian.
- Conocimientos básicos en administración de sistemas y contenedores.

## 👥 Autores

Este proyecto ha sido creado con ❤️ por:

- **Matías López** 🧑‍💻
- **Ignacio Lorenzo** 🧑‍💻


## 📜 Licencia

Este proyecto está bajo la Licencia Apache 2.0 - consulta el archivo [LICENSE.md](LICENSE.md) para más detalles.

---
