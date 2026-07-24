# Guía de Instalación Rápida - Unbreakable-OS (Versión 3)

¡La **Versión 3** de **Unbreakable-OS** ya está cerrada oficialmente para la comunidad! Hemos optimizado el esquema de almacenamiento en dos componentes independientes para garantizar la máxima velocidad, estabilidad y tolerancia a fallos. Ahora el proceso es un despliegue directo de **"quemar las imágenes y listo"**.

---

## 💾 Archivos Necesarios para la Descarga

El sistema operativo se distribuye en dos archivos comprimidos al máximo mediante el algoritmo `xz`:

1. **`SlingShot-ext4.img.xz`**: Imagen destinada a la tarjeta de memoria (o almacenamiento MMC interno), encargada de la partición de arranque (`/boot`).
2. **`Unbreakable-OS-ext4.img.xz`**: Imagen del sistema de archivos raíz (`/`), destinada a tu **disco duro o unidad externa**.

---

## 🛠️ Requisitos Previos

* **Para el arranque**: Una tarjeta de memoria de al menos **8 GB**.
* **Para el sistema**: Un disco externo o unidad flash de al menos **8 GB** (compatible incluso con unidades de almacenamiento genéricas o de prueba).
* **Software de flasheo**: Tu herramienta preferida, como **BalenaEtcher**, **Raspberry Pi Imager** o el comando nativo `dd` en Linux.

---

## 🚀 Proceso de Instalación (Paso Único)

1. **Flashea el arranque**: Quema la imagen `SlingShot-ext4.img.xz` en tu tarjeta de memoria o almacenamiento interno.
2. **Flashea el sistema**: Quema la imagen `Unbreakable-OS-ext4.img.xz` en tu disco o unidad externa.
3. **Conecta los medios**: Introduce la tarjeta de memoria y conecta el disco externo en tu equipo o impresora Sovol.
4. **Enciende el dispositivo**: El sistema operativo arrancará de forma inmediata. La tabla de particiones GPT del disco externo ya viene corregida y optimizada estructuralmente de fábrica, por lo que el entorno quedará 100% operativo al instante.

---

## 🧰 Herramientas Integradas de Fábrica

Olvídate de ejecutar scripts externos, descargas pesadas o comandos complejos en la terminal. Al iniciar sesión, tendrás acceso nativo a las herramientas que la comunidad busca:

* **`printer-adm` / `adm`**: Los alias y scripts de administración personalizados para controlar, reiniciar y verificar los servicios del sistema en caliente.
* **Katapult**: El gestor de arranque definitivo, listo para flashear firmwares de placas directamente por CAN bus o USB sin retirar tarjetas físicas.
* **KIAUH**: El entorno visual interactivo por excelencia para actualizar, instalar o remover Klipper, Moonraker y tus interfaces web de impresión con un solo clic.

---

## 📝 Notas de Versión

* **Estructura GPT Nativa**: Las cabeceras y tablas de particiones han sido fijadas y corregidas con precisión de ingeniería antes de su empaquetado, asegurando compatibilidad absoluta y arranque inmediato en cualquier unidad.
* **Optimización Ext4**: El sistema de archivos raíz ha sido compactado y depurado de forma estricta a los primeros 7-8 GB para garantizar un despliegue seguro, previniendo corrupciones de datos en controladores de disco inestables.
