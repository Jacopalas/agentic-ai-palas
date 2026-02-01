# Palas — Plugin para Claude Code

![Palas Overview](./infographic.svg)

**Habilidades de IA para tu negocio, no solo para tu código.**

Un plugin de Claude Code enfocado en **herramientas genéricas** y **habilidades de dominio** para pequeñas y medianas empresas. Mientras la mayoría de plugins se enfocan en desarrolladores, Palas ayuda a todos—desde operaciones hasta finanzas y marketing.

## ¿Por qué Palas?

La mayoría de plugins de Claude Code se enfocan en desarrollo de software. Palas es diferente:

- **Herramientas genéricas** que funcionan en cualquier proyecto (commits, markdown, seguridad)
- **Habilidades de dominio** para funciones de negocio (finanzas, RRHH, marketing, ventas)
- **Para PYMEs** — herramientas prácticas para equipos pequeños sin IT dedicado

## Instalación

### Desde el Marketplace (Recomendado)

```shell
# Añadir el marketplace (una sola vez)
/plugin marketplace add Jacopalas/palas-marketplace

# Instalar el plugin
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

¿Quieres contribuir una habilidad de dominio? Ver [CONTRIBUTING.md](CONTRIBUTING.md).

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

## Para Usuarios Nuevos

Si no tienes un `.claude/CLAUDE.md` en tu proyecto:

```bash
curl -fsSL https://raw.githubusercontent.com/Jacopalas/agentic-ai-palas/main/starter/minimal-install.sh | bash
```

**Usuarios de Windows**: Ejecutar desde Git Bash, no PowerShell o CMD.

## Contribuir

Bienvenidas las contribuciones, especialmente:

- **Herramientas genéricas** que uses a diario en tus proyectos
- **Habilidades de dominio** para funciones de negocio (finanzas, RRHH, marketing, legal, ventas)
- **Flujos de trabajo para PYMEs** que ayuden a equipos pequeños a trabajar mejor

Este proyecto evita intencionalmente competir con plugins enfocados en desarrolladores. Nuestro nicho son los **usuarios de negocio** y **expertos de dominio** que usan Claude Code.

Ver [CONTRIBUTING.md](CONTRIBUTING.md) para guías e ideas de habilidades.

## Marketplace

Este plugin se distribuye a través del repositorio [palas-marketplace](https://github.com/Jacopalas/palas-marketplace).

## Licencia

MIT
