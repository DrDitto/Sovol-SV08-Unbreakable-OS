# 📊 Resumen Ejecutivo: Ingeniería Inversa y Desacoplamiento de Hardware
### Sistema Operativo: Sovol-SV08-Unbreakable-OS v13.0
### Lead Architect: DrDitto (c) 2026 🇨🇷

---

## 1. 🎯 Objetivo del Proyecto
El ecosistema de fábrica de la Sovol SV08 amarra el sistema operativo (Armbian/Debian alternativo) directamente a las celdas físicas de la MicroSD lateral o una memoria eMMC interna pequeña [source: 1.4]. Esto genera dos problemas críticos de infraestructura:
*   **Degradación del Silicio**: Klipper, Moonraker y las bases de datos temporales escriben logs de forma cíclica las 24 horas, quemando las celdas de la MicroSD en pocos meses [source: 1.4].
*   **Cuello de Botella de E/S**: El bus de la MicroSD limita la tasa de transferencia, ralentizando la carga del entorno vivo [source: 1.4].

**La Solución de Ingeniería Inversa**: Hackear la secuencia de inicialización del cargador de arranque de bajo nivel para forzar un **Desvío Atómico** hacia una unidad masiva de alta velocidad (SSD/USB Industrial), convirtiendo la MicroSD en una pista de despegue 100% pasiva [source: 1.4].

---

## 2. 🔍 Proceso de Desacoplo Técnico

Para lograr el desacoplamiento sin alterar físicamente la placa madre con el procesador Allwinner H616, se aplicó ingeniería inversa sobre el flujo de arranque de las distribuciones basadas en Armbian [source: 1.4]:

### 🚀 Fase A: El Engaño a U-Boot (`boot.scr`)
*   Se descubrió que el chip de silicio busca de forma obligatoria el archivo binario compilado `/boot/boot.scr` en la primera partición formateada en VFAT de la MicroSD [source: 1.4].
*   Se extrajo el script fuente crudo **`boot.cmd`** y se modificó su lógica interna para que, en lugar de montar la partición raíz local de la tarjeta, asimilara las directivas sintácticas de desvío [source: 1.4].
*   Utilizando la herramienta del compilador de Linux `mkimage`, se selló el mapa binario persistente en la MicroSD [source: 1.4].

### 🚀 Fase B: El Anclaje de Pista Pasiva (`armbianEnv.txt`)
*   Se auditó el comportamiento del archivo plano de entorno. Se detectó que si la variable maestro **`rootdev`** se inyectaba con la firma biológica exacta de la unidad masiva mediante la sintaxis estricta **`rootdev=UUID=4263cb5d-9f21-4d32-bd76-d8cd13a8b0f3`**, el Kernel descartaba por completo la MicroSD en caliente [source: 1, 1.4].
*   **Resultado del Letargo**: Una vez que el sistema operativo vivo arranca desde el SSD en arquitectura **XFS empresarial**, la MicroSD entra en un estado pasivo de solo lectura, sufriendo **desgaste cero por escrituras** y quedando blindada ante apagados forzados en frío por hardware [source: 1.4, 1.4.2].

---

## 3. 🛡️ Optimizaciones y Blindaje de Producción (v1.0)

Durante el **Umbreak-thón Sovolesco**, se cerraron las brechas lógicas del entorno vivo para elevar el sistema a un nivel industrial [source: 1.4]:

*   **Pulsión Dinámica de RAM Virtual (`/tmp`)**: Se creó el demonio maestro `unbreakable-tmp.service` [source: 1.3.1]. Ahora el sistema calcula el espacio libre real de tu celda XFS en cada inicio y expande automáticamente el `/tmp` en memoria RAM al **70% de la capacidad disponible**, eliminando cuellos de botella de desborde [source: 1.3.1].
*   **Aislamiento de Infraestructura (`/etc/unbreakable.cfg`)**: Se extrajo la variable `${ROOTDEV}` de los perfiles visuales de consola y se centralizó en un búnker cerrado bajo permisos estrictos **`640`** [source: 1.4]. Solo `root` y el grupo **`sudo`** pueden leer el UUID de la unidad activa, bloqueando accesos no autorizados en texto plano desde usuarios comunes como `sovol` [source: 1.4].
*   **Filtro de Privilegios de Red**: Se inyectó un validador binario en `/etc/profile.d/unbreakable-env.sh` para asegurar que las credenciales inalámbricas (`WIFI_SSID` y `WIFI_PASSWD`) solo floten en la RAM de terminales con privilegios administrativos [source: 1.4].

---

## 4. 📦 El Hito del Empaquetado Ultra Ligero
El gran éxito comercial de esta ingeniería inversa radica en la simetría geométrica lograda en el taller local de Void Linux [source: 1.4]:
*   Se talló un molde **GPT nativo de 2.5 GB** con la partición etiquetada formalmente como **`root`** y Volume Label **`ROOT-SV08`**, volviéndolo 100% amigable para **BalenaEtcher** y Rufus sin lanzar alertas [source: 1.4].
*   El prensado extremo con `xz -9 -e` multinúcleo trituró el tamaño de la distribución, logrando meter el sistema operativo entero en apenas **681 MB** y la pista SlingShot en **105 MB**, listos para expandirse online al tamaño total del disco del usuario en su primera marcha física [source: 1.1.2, 1.4.1].

---
