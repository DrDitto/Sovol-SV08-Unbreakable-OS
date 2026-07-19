#!/usr/bin/env bash
# =========================================================================
#  Sovol-SV08-Unbreakable-OS v13.0 - OFFICIAL DEPLOYMENT & MANUAL KIT
#  Architect / Author: DrDitto (c) 2026
# =========================================================================

clear
echo "========================================================================"
echo "   Sovol-SV08-Unbreakable-OS v13.0 - ARCHITECTURE DOCUMENTATION KIT    "
echo "========================================================================"
echo " 1. Ver Justificación y Motivaciones del Proyecto"
echo " 2. Ver Estructura del Flujo de Arranque (SlingShot vs Unbreakable-OS)"
echo " 3. Ver Manual de Despliegue y Advertencias de BalenaEtcher"
echo " 4. Ver Plantilla de Anuncio para la Comunidad de Facebook"
echo " 5. Salir"
echo "========================================================================"
read -p "Seleccione una opción de lectura [1-5]: " OPT

case $OPT in
1)
    cat << 'INNER_EOF'
## 📌 Justificación Técnica y Orígenes del Desarrollo

El despliegue de Sovol-Unbreakable-OS v13.0 responde de forma directa a la resolución de fallas críticas de infraestructura y limitaciones de hardware presentes en las configuraciones de fábrica. Las razones principales que impulsaron la ingeniería de esta arquitectura son:

1. Implementación de un File System Empresarial (XFS): La necesidad de abandonar formatos de consumo masivo para migrar hacia un sistema de archivos de alta disponibilidad, diseñado para gestionar transacciones pesadas de metadatos con el máximo rendimiento.
2. Mitigación del Riesgo por Pérdida de Fluido Eléctrico: La eliminación definitiva del peligro de daños físicos en las celdas de silicio y corrupciones lógicas en la estructura de archivos, provocados por caídas abruptas de energía o apagones durante la operación activa de la impresora.
3. Superación de la Capacidad de Almacenamiento: Resolver de raíz la barrera de almacenamiento impuesta por las tarjetas MicroSD tradicionales y los módulos eMMC estándar del mercado, habilitando el soporte nativo para discos masivos de alta velocidad.
4. Almacenamiento Modular de Expansión Automática (SlingShot Boot): La necesidad de dotar a la impresora de un método de desvío atómico y pasivo por UUID, permitiendo al usuario final migrar a cualquier tamaño de disco (hasta un SSD de 1 TB) mediante un servicio de auto-expansión en línea (xfs_growfs /) 100% transparente y seguro.
5. Modernización y Actualización de los Núcleos del Sistema: Solucionar la obsolescencia y la falta de imágenes oficiales que cuenten con versiones actuales del Kernel de Linux, garantizando un soporte de controladores optimizado para distribuciones Debian estables modernas.
6. Evadir las Limitaciones del Bus de Datos de la eMMC de Fábrica: Superar los cuellos de botella y fallas de comunicación presentes en la arquitectura nativa del bus de los módulos eMMC integrados, derivados de deficiencias de diseño en la tarjeta controladora original.
INNER_EOF
    ;;
2)
    cat << 'INNER_EOF'
## 🔄 Arquitectura del Flujo de Arranque y Sinergia de Infraestructura

El inicio del sistema se rige bajo un modelo de desacoplamiento atómico en dos etapas bien definidas. La tarjeta MicroSD actúa exclusivamente como un vector de lanzamiento pasivo (SlingShot), delegando la persistencia y la lógica pesada de ejecución al almacenamiento masivo (Unbreakable-OS).

### 🛰️ Diagrama de Secuencia del Arranque Secuencial

[ Hardware: Encendido Eléctrico ] -> 1. Etapa SlingShot (MicroSD Pasiva de 256MB) -> El SoC Allwinner H616 lee mmcblk1p1 (/boot) y levanta U-Boot y Kernel en RAM -> [ Disparador Atómico por UUID ] -> 2. Etapa Unbreakable-OS (Almacenamiento Trasero XFS) -> Se monta la raíz (/) en /dev/sda de forma transparente -> [ Primera Marcha Física ] -> 3. Fase de Expansión Dinámica y Estabilización -> Systemd ejecuta 'armbian-resize-filesystem' en caliente, NetworkManager inyecta 'dhcp-send-hostname=true', el MikroTik asimila el Hostname 'SOVOL-SV08' y Klipper se ejecuta sobre RAM (ZRAM1).

### 🤝 Relación e Interacciones Estratégicas

* SlingShot como el Vector de Lanzamiento: La MicroSD se configura con la bandera estricta 'noatime,nodiratime'. No almacena registros dinámicos, no gestiona bases de datos y no escribe archivos temporales. Su único propósito es servir de trampolín. Al no registrar actividad de escritura, el riesgo de que sufra corrupción física o lógica ante un corte abrupto de energía es del cero por ciento absoluto.
* Unbreakable-OS como el Núcleo de Persistencia: Al consolidarse sobre la partición XFS del almacenamiento externo (USB/SSD), el sistema de archivos toma el control de las operaciones pesadas de Klipper. Al ser un formato con Journaling avanzado de nivel empresarial, si ocurre un apagón, el sistema reconstruye la consistencia de las celdas en un milisegundo, volviéndose inmune a fallas de energía.
* Sincronización online de Geometría: La interacción más crítica ocurre en el primer inicio. SlingShot entrega una raíz virtualizada reducida. Inmediatamente, la orquestación de Systemd en Unbreakable-OS detecta de forma transparente la capacidad del hardware del usuario (sea una memoria Netac de 8 GB o un SSD industrial de 1 TB) y estira los superbloques XFS de forma dinámica y online con xfs_growfs.

### ⚖️ Alcances y Limitaciones de la Arquitectura
* Soporte de Hardware y Enfoque de Diseño: Esta versión cuenta con soporte para Allwinner H616 y derivados. Su ingeniería fue enfocada y parametrizada estrictamente para dotar a la Sovol SV08 de una opción moderna de OS.
* Directiva de Evolución (Roadmap): El H616 es competente para Klipper, pero se encuentra limitado por su bus periférico. Para futuros desarrollos de gama industrial, se recomienda migrar hacia plataformas de procesamiento más modernas que pongan a disposición canales nativos PCIe (PCI Express) para explotar el verdadero potencial NVMe junto a XFS.
INNER_EOF
    ;;
3)
    cat << 'INNER_EOF'
## ⚠️ NOTA CRÍTICA DE DESPLIEGUE: ALERTA DE BALENAETCHER / RUFUS

Al cargar la imagen maestra 'SV08-Unbreakable-OS.img' en herramientas gráficas de quemado como BalenaEtcher, el software lanzará un aviso preventivo con el mensaje:
👉 "[!] Missing partition table / La imagen no parece contener una tabla de particiones".

### 🔍 Explicación Técnica:
Este comportamiento es COMPLETAMENTE NORMAL. Ocurre porque la extracción del clon completo del disco estructural de XFS rompe los esquemas rígidos MBR que buscan las herramientas de consumo basadas en JavaScript. El superbloque de XFS escribe metadatos puros que confunden el escaneo de Etcher, haciéndole creer de forma errónea que la cabecera está vacía.

### 🚀 Protocolo de Inyección Recomendado:
Ignore la advertencia presionando "Continue" en Etcher, o realice la clonación pura bit a bit desde la consola de comandos de Void Linux mediante el comando universal de ingeniería:

$ sudo dd if=SV08-Unbreakable-OS.img of=/dev/sdX bs=4M status=progress && sync

(Sustituya /dev/sdX por el nodo de bloques asignado a su dispositivo de almacenamiento).
INNER_EOF
    ;;
4)
    cat << 'INNER_EOF'
## 🚀 ¡REVOLUCIÓN TOTAL PARA LA SOVOL SV08! Presentamos: Unbreakable-OS v13.0 + SlingShot Boot 🛰️ Un ecosistema indestructible inmune a apagones.

¡Hola a todos, comunidad Sovol! Tras semanas de desarrollo, pruebas de estrés masivas y optimización de bajo nivel, me complace presentarles un proyecto de infraestructura que cambia las reglas del juego para nuestra máquina. 

Si estás cansado de que una micro-caída de energía corrompa los archivos de tu tarjeta, si odias las limitaciones de espacio de los módulos eMMC estándar o si has tenido dolores de cabeza con cuellos de botella en el bus de datos de fábrica debido al diseño de la tarjeta controladora... ¡Esto es para ti!

### 🛡️ ¿Qué es Unbreakable-OS?
Es una distribución de sistema operativo de nivel empresarial basada en las versiones más actuales de Debian (stable) y el Kernel de Linux, diseñada específicamente para la Sovol SV08. Hemos abandonado los sistemas de archivos de consumo y migrado al poderoso formato XFS Empresarial, un sistema ultra-robusto dotado de journaling avanzado que vuelve el almacenamiento de la impresora 100% inmune a corrupciones por cortes abruptos de energía. ¡Adiós al miedo a los apagones!

### 🛰️ El Secreto: Tecnología SlingShot Boot (El Trampolín)
¿Cómo funciona? La MicroSD física pasa a ser un mero vector de lanzamiento pasivo de 256 MB. Al encender la máquina, actúa como un "tirachinas": despierta el cargador U-Boot, monta el Kernel en la RAM y de inmediato le entrega la antorcha al puerto trasero. La MicroSD se queda en reposo absoluto de lectura. Al no registrar escrituras, logs o datos temporales, su riesgo de fallo físico o lógico es del 0% absoluto.

### 💎 Características Maestras y Usabilidad de Alta Gama:
* ⚡ Auto-Expansión Dinámica Online: La imagen base viene compactada de forma inteligente. En su primer arranque, detecta de forma transparente el tamaño de la unidad del usuario y mediante systemd estira automáticamente el mapa de bloques. Si conectas un pendrive Netac barato de 8 GB, o un SSD Industrial de 1 Terabyte, ¡el sistema se autoajusta online en caliente dándote el 100% de la capacidad real al instante!
* 📟 Integración de Red Inteligente: Configurado para forzar el reporte del Hostname de forma verídica. Tu router (¡validado perfectamente en entornos MikroTik industriales!) detectará la máquina de inmediato en la red local bajo su nombre de hardware real: SOVOL-SV08.
* 🛠️ Entorno "adm" Inmediato: Hemos creado una experiencia limpia para el administrador. Se incluye el directorio /home/sovol y un alias maestro universal. Cada vez que entres por SSH, solo debes teclear 'adm' y el sistema invocará automáticamente la interfaz interactiva de KIAUH para actualizar Klipper, Moonraker o Fluidd en un microsegundo.


cat << 'EOF' >> setup_unbreakable.sh
* 🛠️ Entorno "adm" Inmediato: Hemos creado una experiencia limpia para el administrador. Se incluye el directorio /home/sovol y un alias maestro universal. Cada vez que entres por SSH, solo debes teclear 'adm' y el sistema invocará automáticamente la interfaz interactiva de KIAUH para actualizar Klipper, Moonraker o Fluidd en un microsegundo.
* 💾 Cuidado del Silicio: Todas las bitácoras dinámicas corren temporalmente sobre la memoria virtual ZRAM1, liberando de transacciones redundantes a tu disco principal.

📝 Arquitectura e Ingeniería de Infraestructura diseñada por DrDitto (c) 2026.
INNER_EOF
    ;;
*)
    echo "Saliendo del kit de documentación."
    ;;
esac
