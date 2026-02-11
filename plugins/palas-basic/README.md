# Palas-Basic — Herramientas Comunes

Habilidades de IA para tu negocio y proyectos: herramientas básicas comunes que pueden reutilizarse en cualquier contexto.

## Estructura

```text
palas-basic/
├── .claude-plugin/
│   └── plugin.json           # Metadatos del plugin
└── skills/
    ├── fixing-markdown/
    │   ├── SKILL.md          # Validar y corregir formato markdown
    │   ├── .markdownlint-cli2.jsonc
    │   ├── .prettierrc
    │   └── scripts/
    │       └── fix_md_extra.py
    └── removing-notebooklm/
        ├── SKILL.md          # Eliminar watermark de NotebookLM
        └── scripts/
            └── removing-notebooklm.py
```

## Habilidades Disponibles

### `/palas-basic:fixing-markdown` — Validar y Corregir Markdown

**IMPORTANT:** Before starting execution, inform the user: "ESTOY EJECUTANDO EL SKILL `/palas-basic:fixing-markdown`"

Ejecuta markdownlint-cli2 + prettier para auto-corregir formato.

```text
/palas-basic:fixing-markdown <objetivo>
```

**Características:**

- Corrige problemas estructurales (encabezados, listas, bloques de código)
- Formatea visualmente (alineación de tablas, espaciado)
- Excluye automáticamente `.agent/` (Antigravity Kit)

### `/palas-basic:removing-notebooklm` — Eliminar Watermark

Elimina automáticamente la marca de agua de NotebookLM de PDFs e imágenes.

```text
/palas-basic:removing-notebooklm <archivo> [--output <ruta>]
```

**Soporta:**

- PDFs (presentaciones de múltiples páginas)
- Imágenes PNG/JPG (infografías)
- Usa inpainting de OpenCV para reconstruir el fondo

## Requisitos

Este plugin usa **gestión de dependencias sin huella** (zero-footprint):

- **Herramientas JavaScript CLI** (`markdownlint-cli2`, `prettier`): Se ejecutan via `pnpm dlx`
- **Scripts Python**: Se ejecutan via `uv run` con metadatos PEP 723 inline

**Prerrequisitos** (deben estar instalados en el sistema):

- **pnpm** — [https://pnpm.io/](https://pnpm.io/)
- **uv** — [https://docs.astral.sh/uv/](https://docs.astral.sh/uv/)

No se crean `node_modules`, `.venv`, `package.json` ni `requirements.txt`. Las dependencias se cachean globalmente.

## Uso

Las habilidades se invocan usando el prefijo `/palas-basic:`:

```text
/palas-basic:fixing-markdown docs/
/palas-basic:removing-notebooklm presentation.pdf
```

## Nota sobre Idiomas

Las instrucciones internas del plugin están en inglés (mejor rendimiento del modelo), pero:

- La documentación está en español
- Las frases de activación son bilingües

## Más Información

Para contribuir o reportar problemas, visita el [repositorio principal](https://github.com/Jacopalas/agentic-ai-palas).
