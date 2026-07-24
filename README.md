# 🛡️ Unbreakable-OS v3 (Rolling Release Stable)
### El Ecosistema Blindado, Seguro y Robusto para la Sovol SV08

¡La **Versión 3** de **Unbreakable-OS** ya está cerrada oficialmente para la comunidad! Hemos optimizado el esquema de almacenamiento en dos componentes independientes para garantizar la máxima velocidad, estabilidad y tolerancia a fallos. Ahora el proceso es un despliegue directo de **"quemar las imágenes y listo"**.

---

## 📢 Manifiesto de Ingeniería: El Éxito Probado

### 1. Somos Robustos
No tememos al hardware inestable, a las unidades de almacenamiento genéricas ni a los cortes abruptos de energía. Mientras la comunidad de impresión 3D asume la pérdida de datos como algo rutinario, **Unbreakable-OS** redefine la tolerancia a fallos. Nuestra arquitectura de almacenamiento monolítica aísla las dependencias críticas del sistema y blinda el entorno virtual de ejecución, garantizando que el bus de datos y la caché L2 del procesador operen con absoluta fluidez, eliminando de raíz los micro-parones durante impresiones a alta velocidad.

### 2. Somos Seguros
Creemos firmemente en el poder y la transparencia del **Código Abierto (OpenSource)**. Publicamos la totalidad de nuestro código fuente, nuestros scripts maestros y la lógica del hiper-cargador de arranque porque la seguridad no se basa en ocultar secretos, sino en la solidez de la arquitectura. No tememos que intenten replicar nuestro sistema a mano: la ventaja competitiva de este ecosistema es que **ya está probado bajo condiciones extremas**. Cualquiera puede leer el código, pero la comunidad prefiere quemar nuestra imagen lista porque garantizamos el éxito a la primera.

### 3. Estamos Blindados
A través del combo tecnológico de **SlingShot** y el motor central nativo `unbreakable-core`, el sistema operativo cuenta con mecanismos automatizados de inmunidad y auto-mantenimiento. No delegamos la responsabilidad en el usuario final. El sistema se auto-diagnostica, limpia bloqueos (*locks*), reconstruye cachés binarias corruptas en caliente y estabiliza el procesador a un piso de **1.32 GHz** de forma automática en cada arranque, antes de que Klipper levante un solo milímetro de eje. El rootfs no es un software; es una fortaleza digital.

---

## 🛠️ Herramientas Integradas del Ecosistema

Para erradicar la fricción y las experiencias frustrantes asociadas a instalaciones manuales complejas o dependencias rotas de Python 3.13 en Debian Trixie, el núcleo del sistema operativo unifica tres herramientas distintivas bajo el binario maestro `core`:

### 🧰 1. `printer-toolbox`
Un asistente interactivo visual integrado directo en la terminal. El usuario final ya no tiene que buscar mapas de pines en foros de internet ni adivinar comandos complejos por SSH. Con solo escribir `core`, se despliega un panel de control interactivo para:
*   Cargar perfiles de extrusión y calibración rápidos en un solo clic.
*   Administrar servicios en caliente (Klipper, Moonraker, KlipperScreen, Crowsnest).
*   Activar o suspender el módulo nativo de renderizado de video **Timelapse** (FFmpeg precargado).

### 🛡️ 2. `system-guard`
Un demonio nativo de Systemd que se ejecuta en segundo plano durante la secuencia crítica del *boot*. Actúa como el cirujano digital del sistema: si la impresora es apagada de golpe a mitad de una tarea, `system-guard` interviene los descriptores de archivos, purga la caché corrupta de APT y libera los bloqueos del almacenamiento antes de dar luz verde al firmware.

### 📊 3. `health-monitor` (`check-status`)
La cara visible de nuestro control de calidad. Al iniciar sesión por SSH, el sistema supremo elimina los banners aburridos y genéricos de Linux, limpiando la pantalla para mostrar un reporte automatizado a color en el primer segundo de conexión mediante el comando nativo `check-status` (o su alias `salud`):
*   Validación de estado en tiempo real de todos los servicios de impresión.
*   Monitoreo térmico continuo del procesador (manteniendo el hardware fresco a 43°C - 45°C).
*   Monitoreo de almacenamiento expandido, alertando si el disco sufre degradación física.
---

## 🚀 Próximo Hito: SlingShot-UniversalBooter & Reencarnación

El desarrollo no se detiene. Nuestra hoja de ruta avanza hacia la abstracción total de la partición de arranque, transformando el cargador tradicional en el **`SlingShot-UniversalBooter.img`**. 

### 🧬 Mecánica de Arranque Dinámica y Autogestionada
El núcleo de esta revolución reside en el desacoplamiento analítico de las fases de inicio. El cargador universal **SlingShot-UniversalBooter** no es un cargador pasivo: opera como un supervisor de bajo nivel en el primer segundo de energía. 

Al iniciar, el cargador realiza un escaneo atómico de las firmas criptográficas y las cabeceras de metadatos de las particiones modificadas del sistema raíz (`rootfs`). Tras identificar la geometría y la naturaleza del formato del almacenamiento, **inyecta de forma dinámica los módulos de kernel y controladores correspondientes directamente en el Initramfs** antes de ceder el control al espacio de usuario. 

Este puente automatizado levanta el entorno de forma completamente segura, aislando los fallos y consolidando a **Unbreakable-OS** como el entorno definitivo, libre, robusto y blindado de la escena global de la impresión 3D.

---

## 🗽 El Manifiesto de la Libertad Total del Usuario

Nuestra infraestructura no encarcela los datos. El diseño modular de **Unbreakable-OS** ha sido proyectado para otorgar al desarrollador, al *maker* y al usuario final una soberanía absoluta sobre su entorno de producción, bajo tres promesas inquebrantables:

### 1. Cumplimiento Estricto de la GPL v3+
Creemos y defendemos el software libre. Garantizamos el cumplimiento riguroso de la licencia **GNU GPL v3+**. Todo nuestro código fuente, scripts monolíticos de automatización y modificaciones al hiper-cargador de arranque están y estarán disponibles de manera pública y transparente. Tienes la total libertad de auditar, modificar, redistribuir y mejorar el ecosistema, asegurando que el conocimiento permanezca protegido y abierto para toda la comunidad.

### 2. Omnipresencia de FileSystems (Soberanía de Datos)
El sistema te otorga la libertad de **llevar tus datos a cualquiera de los FileSystems soportados por nuestra infraestructura**. ¿Quieres la estabilidad madura de **EXT4**, la resiliencia atómica ante fallos de energía con snapshots en RAM de **BTRFS**, la lectura cruda ultrarrápida de grandes bloques de **XFS**, o la innovación de **BCACHEFS (`Próximamente`)**? Tú eliges. El ecosistema migrará los datos de forma transparente sin que tengas que reconstruir configuraciones de Klipper ni entornos virtuales de Python desde cero.

### 3. Mutación Dinámica de Almacenamiento (Migración Universal)
Tienes la potestad de **migrar, clonar o transformar tu instancia a cualquier unidad USB o almacenamiento externo, utilizando cualquiera de los esquemas de archivos (FS) soportados**. El motor interno `unbreakable-core` se encarga de reestructurar las firmas, formatear el nuevo medio físico de destino, transferir los bloques y recalcular de forma transparente los identificadores UUID para que la transición sea impecable.

---

## 🧰 Blindaje Operativo: Respaldo y Recuperación

El ecosistema cuenta con utilidades integradas en el núcleo del sistema de archivos para mitigar cualquier desastre o fatiga del hardware físico:

*   **Módulo de Respaldo (Backup en Vivo):** Congela de forma segura el estado de tus macros, logs y configuraciones de impresión sin necesidad de detener ejecuciones en caliente ni apagar la impresora.
*   **Módulo de Recuperación:** En caso de micro-cortes o corrupción severa provocada por hardware de baja calidad, el sistema activa rutinas de auto-curación que reparan las tablas y las cachés en el arranque de forma transparente.

---

## ⚙️ Filosofía "Plug and Play" de Alta Escuela

**Solo instala, configura tu impresora y empieza a producir.**  
Hemos erradicado por completo el calvario tradicional de Klipper. Se acabaron las horas muertas peleando contra dependencias rotas de Python, compilando forks inestables a ciegas por SSH o lidiando con bloqueos crónicos en la base de datos de paquetes de Debian. El rootfs ya viene digerido, pre-configurado y testeado bajo estrés extremo. Tu único trabajo es encender la máquina y poner a trabajar tus extrusores.

---

## 📦 Un Solo Núcleo, Tres Versiones Supremas

Para adaptarnos con precisión milimétrica a la filosofía de cada usuario y desarrollador de la comunidad, ofrecemos **tres versiones oficiales**. La robustez no se segmenta: **TODAS las variantes cuentan con el mismo núcleo blindado de fábrica** (el motor `unbreakable-core`, la suite de auto-reparación, los diagnósticos del comando `check-status`, el soporte Multi-FS y las herramientas de fidelización). Tu nivel de control define tu elección:

### 🧠 1. Unbreakable-OS Core
**La base pura con todo el ecosistema empaquetado para que disfrutes de la experiencia completa de ser tú quien decide qué y cómo configurar.**  
Diseñada para los puristas de la administración de sistemas y desarrolladores que quieren el control absoluto del entorno. Te entregamos el rootfs blindado, las cachés de APT reparadas, las librerías científicas de Python 3.13 pre-inyectadas y el motor central listo. A partir de ahí, tú tienes el lienzo en blanco para estructurar, enlazar y levantar tu entorno de impresión exactamente a tu manera, sin software pre-configurado que te condicione.

### ⚙️ 2. Unbreakable-OS for Klipper Mainline
**Solo carga tus datos, configura tu impresora y empieza a producir de inmediato.**  
La versión de alta productividad por excelencia para el usuario que busca estabilidad comercial. Trae la rama principal e inalterada de Klipper, Moonraker y las interfaces web (Mainsail/Fluidd) completamente pre-enlazadas de fábrica y listas para comunicarse con el perfil de tu máquina. Es la definición perfecta de "Plug and Play": flasheas, subes tu archivo de configuración y la impresora se pone a trabajar bajo un entorno predecible, robusto y eficiente.

### 🗡️ 3. Unbreakable-OS for Kalico
**Para los que quieren vivir al filo de la navaja.**  
Diseñada exclusivamente para la vanguardia de la comunidad, los modificadores extremos y los entusiastas que exigen exprimir la cinemática de la **Sovol SV08** más allá de los límites tradicionales. Esta variante sustituye el firmware estándar y trae el binario de **Kalico** (*Danger-Klipper*) completamente integrado, digerido y optimizado a bajo nivel en el rootfs. Olvídate del calvario inaceptable de renegar contra dependencias rotas de Python o compilar código a ciegas por SSH: aquí entras directo al ecosistema con las funciones experimentales desbloqueadas y estables desde el primer segundo.
---

## 💾 Archivos Necesarios para la Descarga

El sistema operativo se distribuye a través del servidor seguro de GitHub en los siguientes componentes comprimidos mediante el algoritmo `xz`:

*   🚀 **[Descargar Imagen de Arranque (SlingShot-ext4.img.xz)](https://github.com)**: Imagen destinada a la tarjeta de memoria (o almacenamiento MMC interno), encargada de la partición de arranque (`/boot`).
*   📦 **[Descargar Sistema Raíz - Parte 1 (Unbreakable-OS-ext4.img.xz.part01)](https://github.com)**: Bloque inicial del sistema de archivos raíz (`/`).
*   📦 **[Descargar Sistema Raíz - Parte 2 (Unbreakable-OS-ext4.img.xz.part02)](https://github.com)**: Bloque complementario del sistema raíz (dividido debido a restricciones de la plataforma de carga).

---

## 🛠️ Requisitos Físicos Previos

*   **Para el arranque:** Una tarjeta de memoria de al menos **8 GB**.
*   **Para el sistema:** Un disco externo o unidad flash de al menos **16 GB** (compatible incluso con unidades genéricas o de prueba).
*   **Software de flasheo:** Tu herramienta preferida (**BalenaEtcher**, **Raspberry Pi Imager** o el comando nativo `dd` en Linux).

---

## 🚀 Proceso de Despliegue de Imágenes

### Paso 1: Unificar la imagen del sistema raíz externo
Antes de proceder con el flasheo, debes guardar ambas partes descargadas (`.part01` y `.part02`) dentro de una misma carpeta y unificarlas ejecutando una sola línea de comandos según tu entorno de trabajo:

*   **En Linux / macOS (Terminal):**
    ```bash
    cat Unbreakable-OS-ext4.img.xz.part* > Unbreakable-OS-ext4.img.xz
    ```
*   **En Windows (Símbolo del sistema / CMD):**
    ```cmd
    copy /b Unbreakable-OS-ext4.img.xz.part01 + Unbreakable-OS-ext4.img.xz.part02 Unbreakable-OS-ext4.img.xz
    ```

### Paso 2: Flashear y arrancar
1.  **Flashea el arranque:** Quema la imagen `SlingShot-ext4.img.xz` en tu tarjeta de memoria o almacenamiento interno.
2.  **Flashea el sistema:** Quema la imagen unificada resultante `Unbreakable-OS-ext4.img.xz` en tu disco o unidad externa.
3.  **Conecta los medios:** Introduce la tarjeta de memoria y conecta el disco externo en tu equipo o impresora Sovol SV08.
4.  **Enciende el dispositivo:** El sistema operativo arrancará de forma inmediata. La tabla de particiones GPT del disco externo ya viene corregida, ampliada a 15G y optimizada estructuralmente de fábrica, por lo que el entorno quedará 100% operativo al instante con 9.0G de espacio libre neto.

---

## 🔒 Verificación de Integridad (SHA256)

Para garantizar de forma segura que tus descargas no sufrieron micro-cortes ni corrupciones de red antes de realizar la unificación, te recomendamos validar las firmas digitales (hashes) de los archivos.

### Hashes Oficiales de la Versión 3:
*   **Arranque (`SlingShot-ext4.img.xz`):** `PEGAR_AQUÍ_EL_HASH_DE_SLINGSHOT`
*   **Sistema Raíz - Parte 1 (`Unbreakable-OS-ext4.img.xz.part01`):** `PEGAR_AQUÍ_EL_HASH_DE_LA_PARTE_01`
*   **Sistema Raíz - Parte 2 (`Unbreakable-OS-ext4.img.xz.part02`):** `PEGAR_AQUÍ_EL_HASH_DE_LA_PARTE_02`

### ¿Cómo verificar las firmas en tu computadora?
*   **En Linux (Terminal):** `sha256sum SlingShot-ext4.img.xz Unbreakable-OS-ext4.img.xz.part*`
*   **En Windows (PowerShell):** `Get-FileHash NombreDelArchivo.xz -Algorithm SHA256`

---

## 🤝 Agradecimientos Especiales y Créditos

Este proyecto no habría alcanzado el nivel de robustez de la **Versión 3** sin laDoc inspiración, el soporte técnico y el empuje de grandes referentes de la comunidad de impresión 3D. ¡Vayan a seguir sus canales oficiales!

*   🎥 **[The Next Layer en Español](https://youtube.com)**: Por democratizar la alta escuela de la impresión 3D en nuestro idioma, inspirando optimizaciones brutales y montajes limpios.
*   🇨🇷 **[Nadir @ CN3D](https://youtube.com)**: Un agradecimiento muy especial por el soporte técnico incondicional, la lucidez para desarmar problemas de firmware y el empuje constante para hacer crecer la comunidad hispana de modificadores. ¡Buena nota, mae!
*   ⚙️ **[gerGoPrint3D](https://youtube.com)**: Por meterle el diente a las calibraciones finas, pruebas de estrés y demostraciones crudas de hardware.
*   🪖 **[ModBotArmy / ModBot](https://youtube.com)**: Por mantener al ejército de modders al día con las mejores mañas mecánicas y de firmware del ecosistema Klipper.
