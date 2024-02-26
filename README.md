# 🚀 Taller Febrero 2024: Automatización con Ansible

## 📌 Descripción

Bienvenidos al repositorio del Taller de Febrero 2024, un proyecto diseñado para automatizar la configuración de entornos de desarrollo utilizando Ansible. Este proyecto es el resultado del esfuerzo colaborativo de Matías López e Ignacio Lorenzo, desarrollado como parte de su obligatorio para el Taller de servidores Linux.

El taller se centra en la automatización de tareas críticas como la actualización de servidores, la instalación y configuración de OpenJDK y Tomcat 8 en contenedores utilizando Podman, y la configuración de un proxy reverso para asegurar un acceso eficiente y seguro a aplicaciones Java.

## 🛠 Configuración de Proyecto

Este proyecto automatiza tareas clave de configuración usando Ansible para eficiencia y seguridad:

1. **Actualización de Servidores** 🔄: Mantiene los servidores actualizados para seguridad y rendimiento óptimos.
2. **OpenJDK y Tomcat en Contenedores** ☕🐱: Instala OpenJDK y Tomcat 8, desplegando la [aplicación de muestra de Tomcat](https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/) mediante Podman.
3. **Proxy Reverso** 🔄↩️: Establece un proxy reverso con Apache para acceso optimizado a aplicaciones Java.
4. **Configuración del Firewall** 🔥: Asegura el entorno mediante reglas de firewall, protegiendo los servicios y gestionando el acceso de manera efectiva.

Cada rol de Ansible se ha creado pensando en la reusabilidad y adaptabilidad, permitiendo personalizaciones según las necesidades. Para más información sobre la implementación, consulta la sección 🚀 [Cómo Empezar](#-cómo-empezar).


## 🗂 Estructura del Proyecto

El proyecto está organizado en varias carpetas y archivos clave que facilitan la comprensión y el uso de Ansible para la automatización:

- `ansible.cfg`: Configuración principal de Ansible.
- `inventory`: Inventario de Ansible con la definición de hosts.
- `playbooks/`: Directorio que contiene los playbooks de Ansible.
  - `bootstrap.yml`: Playbook para la configuración inicial del entorno.
  - `main/`: Directorio principal que incluye el playbook `main.yml` y la definición de roles.
    - `roles/`: Roles de Ansible para tareas específicas como `apache_setup`, `firewall`, `tomcat_setup`, y `update_server`.
- `run.sh`: Script para ejecutar el proyecto y asegurar la instalación de colecciones de Ansible necesarias.

## 🚀 Cómo Empezar

Para utilizar este proyecto y empezar con la automatización, sigue estos pasos:

1. **Descarga del repositorio**: Descarga este repositorio por medio del siguiente comando `git clone https://github.com/qmatiaslopez/tallerfebrero2024.git`.

2. **Pre-requisitos**: Asegúrate de tener Ansible instalado en tu máquina. Este proyecto fue desarrollado con Ansible versión core 2.14.9.

3. **Configura tu Inventario**: Edita el archivo `inventory` para reflejar tus hosts de destino.

4. **Ejecuta el Script `run.sh`**: Este script preparará tu entorno ejecutando comandos necesarios y asegurando que las colecciones de Ansible estén instaladas.


## 📋 Requisitos

Antes de sumergirte en la automatización con este proyecto, asegúrate de tener todo listo. Aquí te detallamos lo que necesitarás:

- **Ansible**: Deberás tener Ansible instalado en tu máquina local.

- **Servidores de Destino**: Dos servidores, deben estar basados en derivados de RHEL (como CentOS o Rocky) o Debian (como Ubuntu). Es crucial que estos servidores tengan un usuario configurado con el mismo nombre de usuario y contraseña en ambos, y que este usuario tenga permisos de `sudo` con o sin contraseña.


## 👥 Autores

Este proyecto ha sido creado con ❤️ por:

- **Matías López** 🧑‍💻
- **Ignacio Lorenzo** 🧑‍💻


## 📜 Licencia

Este proyecto está bajo la Licencia Apache 2.0 - consulta el archivo [LICENSE](LICENSE) para más detalles.
