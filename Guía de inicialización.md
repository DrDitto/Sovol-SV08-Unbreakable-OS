# Guía de inicialización y configuración rápida de Slingshot
### Sistema operativo: Sovol-SV08 Unbreakable OS v2.0
### Compatibilidad: Universal (Cualquier distribución de Linux o entorno gráfico)

Este manual proporciona un procedimiento rápido de 5 pasos para activar la secuencia de arranque dual (**Cold-Boot**) en la impresora **Sovol SV08 MAX** utilizando una tarjeta MicroSD pasiva y una unidad USB principal [source: 5].
Este manual proporciona el procedimiento directo de 4 pasos para grabar las imágenes y activar el arranque dual en la impresora **Sovol SV08 MAX** utilizando una tarjeta MicroSD (mínimo 1GB) y tu unidad USB principal (llave Netac).

###########################################################################
#  ⚠️ NOTA PARA LOS SYSADMINS:                                            #
#  NO RECOMPILE EL boot.cmd BAJO NINGUNA RAZÓN LÓGICA QUE SE LE OCURRA.   #
#  SLINGSHOT ES DEPENDIENTE DE LAS DEFINICIONES AQUÍ INCLUIDAS,           #
#  CAMBIAR ALGO PUEDE PROVOCAR UNA ROTURA DEL SISTEMA.                    #
###########################################################################

---


## Paso 1: Grabar la imagen base de Slingshot en la MicroSD

Debes volcar la imagen de arranque en bruto dentro de una tarjeta MicroSD física (se requiere una capacidad mínima de **1 GB** [source: 5]). Puedes hacerlo de dos maneras:

*   **Método Gráfico (Recomendado para cualquier OS)**: Abre la aplicación **BalenaEtcher**, selecciona el archivo `Slingshot-Boot-Base.img.xz`, elige tu tarjeta MicroSD y presiona **Flash**.
*   **Método por Terminal (Linux)**: Identifica el nodo de tu tarjeta (ej. `/dev/sdX` o `/dev/mmcblkX`) y ejecuta la tubería de descompresión en crudo [source: 5]:
    ```bash
    xzcat Slingshot-Boot-Base.img.xz | sudo dd of=/dev/sdX bs=4M status=progress oflag=sync
    ```

---

## Paso 2: Instalar los programas necesarios en la computadora

Si vas a usar la terminal para compilar, abre una consola en tu computadora de desarrollo e instala las herramientas esenciales de bajo nivel [source: 5]. Ejecuta **uno** de estos comandos según la distribución de Linux que utilices:

*   **Ubuntu / Debian / Linux Mint / Pop!_OS**:
    ```bash
    sudo apt update && sudo apt install u-boot-tools grep sed coreutils
    ```
*   **Fedora / Red Hat / CentOS**:
    ```bash
    sudo dnf install u-boot-tools grep sed coreutils
    ```
*   **Arch Linux / Manjaro / EndeavourOS**:
    ```bash
    sudo pacman -Sy uboot-tools grep sed coreutils
    ```
*   **Void Linux**:
    ```bash
    sudo xbps-install -S u-boot-tools grep sed coreutils
    ```

---

## Paso 3: Grabar la imagen del Sistema Operativo en el disco USB

Realiza el volcado en crudo del sistema operativo definitivo dentro de tu unidad USB principal (llave Netac de 7.5GB o superior) [source: 5]. Puedes hacerlo de dos maneras:

*   **Método Gráfico**: Abre **BalenaEtcher**, selecciona el archivo `Sovol-SV08-Unbreakable-OS-v2.0.img.xz`, elige tu unidad USB Netac y presiona **Flash**.
*   **Método por Terminal (Linux)**: Reemplaza `/dev/sdY` con el nombre real de tu dispositivo USB (verifica con cuidado para evitar borrar tu disco duro principal) [source: 5]:
    ```bash
    xzcat Sovol-SV08-Unbreakable-OS-v2.0.img.xz | sudo dd of=/dev/sdY bs=4M status=progress oflag=sync
    ```

---

## Paso 4: Modificar el identificador de tu almacenamiento USB

1. Abre la carpeta principal de la tarjeta MicroSD (donde grabaste Slingshot en el Paso 1) [source: 5].
2. Abre el archivo de texto plano llamado **`armbianEnv.txt`** con cualquier editor de texto [source: 3, 5].
3. Busca la línea que empieza con **`rootdev=`** y reemplaza el valor de fábrica por el identificador único (`UUID` o `PARTUUID`) de la partición del disco USB Netac que acabas de grabar en el Paso 3 [source: 3, 5]:

```text
# Modifica estrictamente esta línea con el identificador único de tu unidad USB:
rootdev=UUID=028f2806-d1cd-4aa4-abc4-79e4fe506a9d
```
4. Guarda los cambios y cierra el archivo [source: 5].

---

## Paso 5: Ejecutar el script de compilación automática

Abre una terminal directamente dentro de la carpeta principal de tu tarjeta MicroSD y ejecuta el script automatizado como **`root`** (o usando `sudo`) para procesar y engranar el arranque en las pistas de la tarjeta [source: 5]:

```bash
sudo ./boot-adm
```

Una vez que la terminal te devuelva el reporte de confirmación en verde, la sincronización ha concluido con éxito [source: 5]. Extrae la MicroSD de tu computadora de forma segura, clávala en la ranura de tarjetas interna de la impresora, conecta tu unidad USB Netac recién grabada y enciende el interruptor general de la **Sovol SV08 MAX** [source: 5].
