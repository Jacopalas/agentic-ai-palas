# Palas — Plugin para Claude Code

![Palas Overview](./infographic.svg)

## ¿Por qué Palas?

**Habilidades de IA para tu negocio, no solo para tu código.**

Un plugin de Claude Code que une **productividad general y conocimiento especializado** para ayudar a particulares y PYMES a dar sus primeros pasos en la IA.

Mientras la mayoría de plugins se centran en el desarrollo de software, Palas nace para ayudar a todos: desde el crecimiento personal y la gestión de datos, hasta operaciones, finanzas y marketing.

## Conceptos Clave

Si es tu primera vez usando una herramienta de este tipo, aquí tienes lo básico para entender el potencial:

* 🤖 **IA Agéntica:** A diferencia de un chat normal (que solo "habla"), una IA agéntica puede **actuar**. Tiene "manos": puede leer tus archivos, ejecutar comandos, realizar cálculos y tomar decisiones para completar tareas complejas de forma autónoma.
* 🧩 **Plugins:** Son extensiones que le dan nuevos "superpoderes" a la IA. Imagínalos como las apps que instalas en tu móvil para hacer cosas que no venían de fábrica.
* 🛠️ **Habilidades (Skills):** Son las tareas específicas que Palas añade a tu entorno. Si el plugin es la caja de herramientas, las habilidades son el martillo, la calculadora o el gestor de archivos.

## Para Usuarios Nuevos

¿Empezando de cero? Si tienes el efecto "papel en blanco" y tu carpeta está vacía, este comando te crea una configuración mínima:

```bash
# Abre una terminal y navega a tu proyecto
cd ~/Documentos/mi-proyecto

# Crea la configuración mínima
# Usuarios de Windows: Ejecutar desde Git Bash, no PowerShell o CMD.
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/starter/minimal-install.sh | bash
```

**¿Qué hace?** Crea una carpeta `.claude/` con un archivo `CLAUDE.md` que contiene:

- Instrucciones básicas para Claude sobre tu proyecto
- Las habilidades de Palas listas para usar
- Un espacio donde añadir notas específicas de tu proyecto

Piensa en `CLAUDE.md` como el "briefing" que le das a Claude cada vez que abre tu proyecto. Cuanto más contexto le des, mejor te ayudará.

## Instalación del Plugin "Palas"

Primero sitúate en el proyecto en el que vas a trabajar:

**Opción A — Línea de comando:**

```bash
# Abre una terminal y navega a tu proyecto
cd ~/Documentos/mi-proyecto

# Inicia Claude Code
claude
```

**Opción B — Desde un IDE (VS Code, Cursor, etc.):**

1. Abre tu proyecto en el IDE
2. Abre el panel de Claude Code (normalmente en la barra lateral)
3. Claude ya estará en el contexto de tu proyecto

### Instala "Palas" desde el Marketplace (Recomendado)

```shell
# Añadir el marketplace (una sola vez)
/plugin marketplace add Jacopalas/palas-marketplace

# Instalar el plugin Palas
/plugin install palas@palas
```

### Instalación Directa

```shell
# Clonar y cargar directamente
git clone https://github.com/Jacopalas/agentic-ai-palas.git
claude --plugin-dir ./agentic-ai-palas
```

## Habilidades Disponibles

### Herramientas Genéricas

| Habilidad | Comando | Descripción |
|-----------|---------|-------------|
| Commit | `/palas:commit` | Crear commits de git bien formateados |
| Markdown | `/palas:fixing-markdown` | Validar y corregir formato de markdown |
| Seguridad | `/palas:security-scan` | Escanear secretos expuestos y vulnerabilidades |
| Watermark | `/palas:removing-notebooklm` | Eliminar marcas de agua de NotebookLM en PDFs/imágenes |

### Habilidades de Dominio (Roadmap)

Estamos construyendo habilidades para dominios de negocio:

| Dominio | Ejemplos |
|---------|----------|
| **Finanzas** | Revisión de facturas, análisis de presupuestos, informes de gastos |
| **Marketing** | Revisión SEO de contenido, posts para redes, newsletters |
| **RRHH** | Descripciones de puesto, checklists de onboarding, políticas |
| **Ventas** | Propuestas comerciales, emails de seguimiento, notas de reuniones |
| **Legal** | Revisión de contratos, checklists de cumplimiento, NDAs |

¿Quieres contribuir una habilidad de dominio? Echa un ojo al documento [CONTRIBUIR.md](CONTRIBUIR.md).

## Ejemplos de Uso

```text
/palas:commit
-> Analiza cambios staged y crea un commit convencional

/palas:fixing-markdown docs/
-> Corrige formato markdown en todos los archivos de docs/

/palas:security-scan
-> Escanea el directorio actual buscando secretos expuestos
```

## Requisitos

- **Claude Code** v1.0.33 o posterior
- **Node.js** (para linting de markdown) — se instala en el primer uso
- **Python 3** (para eliminar watermarks) — se instala en el primer uso

Las dependencias se instalan automáticamente en entornos aislados. Sin contaminar tu proyecto o sistema.

## Nota sobre Idiomas

> **¿Por qué las instrucciones internas están en inglés?**
>
> Los modelos de IA funcionan mejor con instrucciones en inglés. Por eso:
> - El **motor del plugin** (instrucciones que Claude ejecuta) está en inglés
> - La **documentación y ejemplos** (lo que tú lees) está en español
> - Las **trigger phrases** son bilingües para que puedas hablar con Claude en español
>
> Esto garantiza la mejor experiencia: máxima fiabilidad técnica + documentación en tu idioma.

## Contribuir

Bienvenidas las contribuciones, especialmente:

- **Herramientas genéricas** que uses a diario en tus proyectos
- **Habilidades de dominio** para funciones de negocio (finanzas, RRHH, marketing, legal, ventas)
- **Flujos de trabajo para PYMEs** que ayuden a equipos pequeños a trabajar mejor

Este proyecto evita intencionalmente competir con plugins enfocados en desarrolladores. Nuestro nicho son los **usuarios de negocio** y **expertos de dominio** que usan Claude Code.

Lee el documento [CONTRIBUIR.md](CONTRIBUIR.md) donde explico guías e ideas de habilidades.

## Marketplace

Este plugin se distribuye a través del repositorio [palas-marketplace](https://github.com/Jacopalas/palas-marketplace).

## Licencia

MIT
