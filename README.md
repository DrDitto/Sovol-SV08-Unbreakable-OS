# 🎛️ Sovol-SV08-Unbreakable-OS v1.0
### Architect & Author: DrDitto (c) 2026 🇨🇷

¡Pura vida, mae! Este es el cuartel general del ecosistema **Unbreakable-OS**, la distribución definitiva de nivel industrial para la impresora **Sovol SV08**. El sistema está diseñado bajo una arquitectura modular de desacoplamiento de hardware, garantizando un entorno veloz, robusto y 100% autogestionable.

---

## 🗺️ Diagrama de Secuencia de Arranque (Desvío Atómico)

Así es como fluyen los bits en el microsegundo en que encendés el interruptor general de la impresora. **SlingShot Boot** actúa como la pista de despegue pasiva y le hereda el control absoluto a tu unidad de almacenamiento masivo.

```text
 +-----------------------------------------------------------------------+

 |                     ENCENDIDO GENERAL DE HARDWARE                 |
 |                Alimentación eléctrica al procesador Allwinner H616    |
 +-----------------------------------------------------------------------+
                                     |
                                     v
 +-----------------------------------------------------------------------+

 |                     RANURA LATERAL: MicroSD                       |
 |             Lectura en frío del bloque físico pasivo /dev/mmcblk1      |
 +-----------------------------------------------------------------------+
                                     |
                                     v
 +-----------------------------------------------------------------------+

 |                     CARGADOR DE BAJO NIVEL: U-Boot                |
 |            Interpreta el mapa binario compilado: /boot/boot.scr       |
 +-----------------------------------------------------------------------+
                                     |
                                     v
 +-----------------------------------------------------------------------+

 |                 PISTA DE DESPEGUE: SlingShot Boot                 |
 |     Sanea y procesa la directiva sintáctica en /boot/armbianEnv.txt   |
 |           --> rootdev=UUID=4263cb5d-9f21-4d32-bd76-d8cd13a8b0f3       |
 +-----------------------------------------------------------------------+
                                     |
                                     v
 +-----------------------------------------------------------------------+

 |                 DESVÍO DE COMPORTAMIENTO BIOLÓGICO                 |
 |        U-Boot descarta la MicroSD y apunta la aguja hacia el bus USB  |
 +-----------------------------------------------------------------------+
                                     |
                                     v
 +-----------------------------------------------------------------------+

 |            UNIDAD MASIVA SELECCIONADA (SSD / USB Industrial)      |
 |             Montaje atómico del sistema de archivos empresarial:       |
 |                    --> Volumen Raíz: /dev/sda1 [XFS]                  |
 +-----------------------------------------------------------------------+
                                     |
                                     v
 +-----------------------------------------------------------------------+

 |                 ARRANQUE DEL ENTORNO VIVO (INIT SYSTEM)           |
 |     Carga de daemons, Moonraker, Klipper y el ecosistema de impresión |
 +-----------------------------------------------------------------------+
```

---


---

## ⚙️ Inteligencia y Blindaje del Sistema

1.  **RAM Virtual Autogestionable (`/tmp`)**: El demonio `unbreakable-tmp.service` calcula el espacio libre real de la partición XFS en cada arranque y estira automáticamente el `/tmp` en memoria RAM al **70% de la capacidad disponible** (653 GB flotantes al operar en el SSD de 1 TB).
2.  **Búnker Seguro de Variables (`/etc/unbreakable.cfg`)**: La variable de infraestructura `${ROOTDEV}` está aislada y protegida bajo permisos **`640`** (lectura exclusiva para `root` y el grupo **`sudo`**), volviéndola invisible en texto plano para los usuarios comunes.
3.  **Filtro Dinámico de Privilegios**: El inyector `/etc/profile.d/unbreakable-env.sh` verifica si el ID de la consola pertenece a la jerarquía de administradores antes de exponer las credenciales inalámbricas de red (`WIFI_SSID` y `WIFI_PASSWD`).

---

## 💎 Ventajas Técnicas de SlingShot Post-Arranque (Ciclo de Vida Pasivo)

La genialidad del diseño de **SlingShot Boot** radica en lo que sucede **después** de que el sistema operativo vivo toma el control absoluto de la impresora:

*   **Aislamiento y Letargo Térmico**: Una vez que el Kernel realiza el desvío atómico hacia la unidad masiva, la MicroSD física de la ranura lateral finaliza su tarea y entra en un estado pasivo de letargo.
*   **Desgaste Cero del Silicio**: Al estar el `/tmp` montado en RAM y la raíz en el SSD, **la MicroSD sufre cero escrituras cíclicas**, extendiendo su vida útil prácticamente para siempre y salvándola de la degradación por logs.
*   **Inmunidad a Fallas de Corriente**: Si la impresora sufre un apagado en frío por hardware, la MicroSD no corre riesgo de corromperse lógicamente porque no tiene descriptores abiertos en ese instante.

---

## 🤝 Agradecimientos y Créditos a la Comunidad

Este proyecto no habría alcanzado esta madurez técnica sin apoyarse en los hombros de gigantes del código y la divulgación de impresión 3D. Un agradecimiento masivo a los siguientes pilares de la comunidad:

### 💻 Repositorios Base:
*   **[Sovol-SV08-Mainline de Rappetor](https://github.com)**: El mapa de ruta dorado que abrió los ojos a la comunidad para migrar la SV08 hacia el Klipper Mainline y liberarnos del firmware restrictivo de fábrica [source: 0.1.1].

### 📺 Canales de YouTube y Comunidad Esencial:
*   **[The Next Layer en Español](https://youtube.com)**: Por democratizar la alta escuela de la impresión 3D en nuestro idioma, inspirando optimizaciones brutales y montajes limpios [source: 0.1.2].
*   **Nadir @ CN3D**: Un agradecimiento muy especial por el soporte técnico incondicional, la lucidez para desarmar problemas de firmware y el empuje constante para hacer crecer la comunidad hispana de modificadores. ¡Buena nota, mae!
*   **[gerGoPrint3D](https://youtube.com)**: Por meterle el diente a las calibraciones finas, pruebas de estrés y demostraciones crudas de hardware.
*   **[ModBotArmy](https://youtube.com)**: Por mantener al ejército de modders al día con las mejores mañas mecánicas y de firmware del ecosistema Klipper.

---
Diseñado con total rigor de ingeniería bajo el sol de Costa Rica. ¡Pura vida, papá! 🇨🇷🍻
