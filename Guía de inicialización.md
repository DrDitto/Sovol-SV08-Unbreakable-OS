# Guía de Instalación Rápida - Unbreakable-OS (Versión 3)

¡La **Versión 3** de **Unbreakable-OS** ya está cerrada oficialmente para la comunidad! Hemos optimizado el esquema de almacenamiento en dos componentes independientes para garantizar la máxima velocidad, estabilidad y tolerancia a fallos. Ahora el proceso es un despliegue directo de **"quemar las imágenes y listo"**.

---

## 💾 Archivos Necesarios para la Descarga

El sistema operativo se distribuye en los siguientes archivos comprimidos al máximo mediante el algoritmo `xz`:

1. **`SlingShot-ext4.img.xz`**: Imagen destinada a la tarjeta de memoria (o almacenamiento MMC interno), encargada de la partición de arranque (`/boot`).
2. **`Unbreakable-OS-ext4.img.xz.part01`** y **`Unbreakable-OS-ext4.img.xz.part02`**: La imagen del sistema de archivos raíz (`/`) dividida en dos partes debido a restricciones de tamaño en la plataforma de descarga.

---

## 🛠️ Requisitos Previos

* **Para el arranque**: Una tarjeta de memoria de al menos **8 GB**.
* **Para el sistema**: Un disco externo o unidad flash de al menos **16 GB** (espacio ampliado de fábrica a 15G limpios).
* **Software de flasheo**: Tu herramienta preferida, como **BalenaEtcher**, **Raspberry Pi Imager** o el comando nativo `dd` en Linux.

---

## 🚀 Proceso de Instalación

### Paso 1: Unir la imagen del sistema externo
Antes de flashear, debes descargar ambas partes del sistema raíz en la misma carpeta y unirlas ejecutando un único comando según tu sistema operativo:

* **En Linux / macOS (Terminal):**
  ```bash
  cat Unbreakable-OS-ext4.img.xz.part* > Unbreakable-OS-ext4.img.xz
  ```
* **En Windows (Símbolo del sistema / CMD):**
  ```cmd
  copy /b Unbreakable-OS-ext4.img.xz.part01 + Unbreakable-OS-ext4.img.xz.part02 Unbreakable-OS-ext4.img.xz
  ```

### Paso 2: Flashear y arrancar
1. **Flashea el arranque**: Quema la imagen `SlingShot-ext4.img.xz` en tu tarjeta de memoria o almacenamiento interno.
2. **Flashea el sistema**: Quema la imagen unificada resultante `Unbreakable-OS-ext4.img.xz` en tu disco o unidad externa.
3. **Conecta los medios**: Introduce la tarjeta de memoria y conecta el disco externo en tu equipo o impresora Sovol.
4. **Enciende el dispositivo**: El sistema operativo arrancará de forma inmediata. La tabla de particiones GPT del disco externo ya viene corregida, ampliada a 15G y optimizada de fábrica, por lo que el entorno quedará 100% operativo al instante con 9.0G de espacio libre.

---

## 🧰 Herramientas Integradas de Fábrica

Olvídate de ejecutar scripts externos, descargas pesadas o comandos complejos en la terminal. Al iniciar sesión con tu usuario o escribir el comando nativo `salud`, tendrás acceso a:

* **`salud` / `check`**: Script de diagnóstico en tiempo real que verifica Klipper, temperaturas y almacenamiento a color.
* **`printer-adm` / `adm`**: Los alias y scripts de administración personalizados para controlar, reiniciar y verificar los servicios del sistema en caliente.
* **Katapult**: El gestor de arranque definitivo, listo para flashear firmwares de placas directamente por CAN bus o USB sin retirar tarjetas físicas.
* **KIAUH**: El entorno visual interactivo por excelencia para actualizar o instalar Klipper, Moonraker y tus interfaces web de impresión con un solo clic.
* **Timelapse**: Módulo `moonraker-timelapse` y el motor binario `ffmpeg` pre-instalados de fábrica para capturar tus impresiones en video de forma nativa.
