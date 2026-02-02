# Palas-Basic — Herramientas Comunes

Habilidades de IA para tu negocio y proyectos: herramientas básicas comunes que pueden reutilizarse en cualquier contexto.

## Estructura

```
palas-basic/
├── .claude-plugin/
│   └── plugin.json           # Metadatos del plugin
├── _tooling/                  # Dependencias (Node.js y Python)
│   ├── package.json          # Deps de Node.js (markdownlint, prettier)
│   ├── .markdownlint-cli2.jsonc
│   ├── .prettierrc
│   └── requirements.txt      # Deps de Python (Pillow, pymupdf, opencv)
└── skills/
    ├── fixing-markdown/
    │   └── SKILL.md          # Validar y corregir formato markdown
    └── removing-notebooklm/
        ├── SKILL.md          # Eliminar watermark de NotebookLM
        └── scripts/
            └── removing-notebooklm.py
```

## Habilidades Disponibles

### `/palas-basic:fixing-markdown` — Validar y Corregir Markdown

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

- **Node.js** — Para markdownlint y prettier
- **Python 3** — Para procesamiento de imágenes/PDFs

Las dependencias se instalan automáticamente en la primera ejecución dentro de `_tooling/`.

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
