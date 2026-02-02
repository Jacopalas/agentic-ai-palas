# Plugin de Ejemplo

Un plugin completo de ejemplo que demuestra las opciones de extensión de Claude Code.

## Estructura

```
example-plugin/
├── .claude-plugin/
│   └── plugin.json        # Metadatos del plugin
├── .mcp.json              # Configuración del servidor MCP
├── commands/
│   └── example-command.md # Definición del comando slash
└── skills/
    └── example-skill/
        └── SKILL.md       # Definición de la habilidad
```

## Opciones de Extensión

### Comandos (`commands/`)

Los comandos slash son invocados por el usuario mediante `/nombre-comando`. Se definen como archivos markdown con frontmatter:

```yaml
---
description: Descripción corta para /help
argument-hint: <arg1> [arg-opcional]
allowed-tools: [Read, Glob, Grep]
---
```

**Campos del frontmatter:**

| Campo | Descripción |
|-------|-------------|
| `description` | Descripción mostrada en /help |
| `argument-hint` | Pistas sobre los argumentos del comando |
| `allowed-tools` | Herramientas pre-aprobadas (reduce prompts de permisos) |
| `model` | Sobrescribir el modelo (ej. "haiku", "sonnet", "opus") |

### Habilidades (`skills/`)

Las habilidades son capacidades invocadas por el modelo. Crea un `SKILL.md` en un subdirectorio:

```yaml
---
name: nombre-habilidad
description: Condiciones de activación para esta habilidad
version: 1.0.0
---
```

**Diferencias clave:**

| Tipo | Invocación | Uso |
|------|------------|-----|
| Comando | Usuario escribe `/comando` | Acciones explícitas solicitadas |
| Habilidad | Claude decide automáticamente | Guía contextual incorporada |

### Servidores MCP (`.mcp.json`)

Configura integración con herramientas externas mediante Model Context Protocol:

```json
{
  "nombre-servidor": {
    "type": "http",
    "url": "https://mcp.example.com/api"
  }
}
```

**Tipos de conexión:**

| Tipo | Descripción |
|------|-------------|
| `http` | Servidor HTTP/HTTPS |
| `stdio` | Proceso local via stdin/stdout |
| `sse` | Server-Sent Events |
| `ws` | WebSocket |

## Uso

- `/example-command [args]` — Ejecuta el comando slash de ejemplo
- La habilidad de ejemplo se activa según el contexto de la tarea
- El MCP de ejemplo se activa según el contexto de la tarea

## Crear Tu Propio Plugin

1. Copia esta estructura de directorios
2. Modifica `plugin.json` con tu nombre y descripción
3. Añade tus comandos en `commands/`
4. Añade tus habilidades en `skills/`
5. Configura servidores MCP si necesitas integración externa

## Más Información

Para más detalles sobre desarrollo de plugins de Claude Code, consulta la [documentación oficial](https://code.claude.com/docs/en/plugins).
