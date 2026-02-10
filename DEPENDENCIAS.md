# Preparar tu ordenador para ejecutar Scripts Python/JS

Algunos Skills de los Plugins ejecutan scripts en Python o JavaScript. Para que funcionen, necesitas tener instalado tanto Python como NodeJS, y un par de programas adicionales para manejar las dependencias.

## Paso 1: Instalar Python y/o Node.js

Dependiendo de qué skills uses, puede que necesites uno o ambos. Mi recomendación es que instales ambos.

### Python

Necesario para skills que procesan imágenes, PDFs, datos, etc.

| Sistema | Cómo instalar |
|---------|---------------|
| **Windows** | Descarga desde [python.org/downloads](https://www.python.org/downloads/) o ejecuta `winget install Python.Python.3.12` |
| **macOS** | Ejecuta `brew install python` o descarga desde [python.org/downloads](https://www.python.org/downloads/) |
| **Linux** | Ejecuta `sudo apt install python3` (Ubuntu/Debian) o `sudo dnf install python3` (Fedora) |

### Node.js

Necesario para skills que usan herramientas de formato de texto (markdown, prettier, etc.).

| Sistema | Cómo instalar |
|---------|---------------|
| **Windows** | Descarga desde [nodejs.org](https://nodejs.org/) o ejecuta `winget install OpenJS.NodeJS` |
| **macOS** | Ejecuta `brew install node` o descarga desde [nodejs.org](https://nodejs.org/) |
| **Linux** | Ejecuta `sudo apt install nodejs` (Ubuntu/Debian) o consulta [nodejs.org](https://nodejs.org/) |

## Paso 2: Instalar los gestores de dependencias

Aquí viene la magia: los scripts de los skills pueden necesitar librerías externas (dependencias), pero los hemos diseñado para que **no ensucien tu proyecto** con carpetas como `node_modules` o `.venv`. Todo se guarda en una caché global de tu ordenador.

Para conseguirlo, necesitas instalar dos programas:

### uv (para Python)

Es el programa que ejecuta los scripts Python y gestiona sus dependencias automáticamente.

| Sistema | Cómo instalar |
|---------|---------------|
| **Windows** | Abre PowerShell y ejecuta: `powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 \| iex"` |
| **macOS/Linux** | Abre Terminal y ejecuta: `curl -LsSf https://astral.sh/uv/install.sh \| sh` |

Más info: [docs.astral.sh/uv](https://docs.astral.sh/uv/)

### pnpm (para JavaScript)

Es el programa que ejecuta herramientas JavaScript sin instalar nada en tu proyecto.

| Sistema | Cómo instalar |
|---------|---------------|
| **Windows** | Ejecuta: `winget install pnpm.pnpm` |
| **macOS** | Ejecuta: `brew install pnpm` |
| **Linux** | Ejecuta: `curl -fsSL https://get.pnpm.io/install.sh \| sh -` |

Más info: [pnpm.io/installation](https://pnpm.io/installation)

## ¿Cómo funciona todo esto?

No te preocupes por los detalles técnicos. Claude se encarga de ejecutar todo correctamente. Pero si tienes curiosidad:

**Scripts Python:** Cuando un skill ejecuta un script Python, usa el comando `uv run script.py`. El programa `uv` lee las dependencias (si las tiene) que el script necesita (están escritas dentro del propio archivo) y las descarga automáticamente la primera vez. Las siguientes ejecuciones son instantáneas porque ya están en caché.

**Herramientas JavaScript:** Cuando un skill necesita una herramienta como `prettier` o `markdownlint`, usa el comando `pnpm dlx nombre-herramienta`. Esto descarga y ejecuta la herramienta sin dejar rastro en tu proyecto.

## Resumen

| Qué necesitas | Para qué sirve | Comando de instalación (Windows) |
|---------------|----------------|----------------------------------|
| Python | Ejecutar scripts Python | `winget install Python.Python.3.12` |
| Node.js | Ejecutar herramientas JS | `winget install OpenJS.NodeJS` |
| uv | Gestionar dependencias Python | Ver tabla arriba |
| pnpm | Gestionar herramientas JS | `winget install pnpm.pnpm` |

Una vez instalado todo, los skills funcionarán automáticamente. No tienes que hacer nada más.
