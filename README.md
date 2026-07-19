# 📦 Búnker de Imágenes de Distribución - Unbreakable-OS
### Diseñado por DrDitto (c) 2026 🇨🇷

¡Pura vida, mae! Este directorio es el almacén exclusivo para los contenedores binarios maestros de la distribución. Aquí residen los clones atómicos listos para producción y despliegue masivo en hardware real.

---

## 💎 Las Gemas del Umbreak-thón (Pesos Netos)
Gracias al prensado extremo `xz -9 -e` multinúcleo, logramos reducir el almacenamiento de la competencia a un tamaño de risa:

*   **`SV08-Unbreakable-OS.img.xz` (681 MB)**: El sistema operativo completo en arquitectura XFS empresarial con escalado dinámico de memoria virtual. Al quemarse, representa **2.5 GB reales** y se auto-expandirá online al 100% de la capacidad del disco destino [source: 1.1.2, 1.2.1, 1.4.1].
*   **`SV08_SlingShot_BOOT.img.xz` (105 MB)**: El clon de la pista de despegue pasiva de la MicroSD física (U-Boot + scripts de control modular) [source: 1.4, 1.4.1].

---

## 🚀 Opciones de Despliegue y Quemado

### Opción A: Gestores Gráficos (Fácil)
Si preferís la comodidad de la interfaz gráfica, el archivo `.img.xz` está homologado de fábrica en tabla GPT nativa para ser devorado de forma directa sin necesidad de descomprimirlo previamente por:
*   **BalenaEtcher** (Soportado oficialmente sin lanzar alertas de geometría o particiones corruptas) [source: 1.4].
*   **Rufus** (Modo de imagen cruda DD).
*   **Raspberry Pi Imager** (Usando la opción de "Custom IMG").

### Opción B: Despliegue Manual por Consola (A lo Macho Alfa)
Si preferís mandar a volar los bits directamente desde la terminal de tu distribución preferida, seguí este protocolo estricto en frío [source: 1.4]:

#### 🧪 Paso 1: Descomprimir la gema en caliente
Para liberar el binario crudo sin borrar el archivo comprimido original [source: 1.4.1]:
```bash
xz -d -k -v SV08-Unbreakable-OS.img.xz
```

#### 🧪 Paso 2: Inyectar el clon en el silicio (`dd`)
Identificá la unidad de destino con `lsblk` (por ejemplo, tu pendrive o SSD en `/dev/sdb`) y corre la aguja milimétrica configurando los **640 bloques exactos** de 4M [source: 1.2.1, 1.4]:
```bash
sudo umount /dev/sdb1 2>/dev/null || true
sudo dd if=SV08-Unbreakable-OS.img of=/dev/sdb bs=4M count=640 status=progress && sync
```

---
🛑 **NOTA DE SEGURIDAD**: Asegurate tres veces de apuntar a la letra correcta del disco (`of=/dev/sdX`) [source: 1.4]. ¡No vayás a volar el almacenamiento de tu propia máquina por un dedazo! 

¡Pura vida, papá! 🇨🇷🍻
