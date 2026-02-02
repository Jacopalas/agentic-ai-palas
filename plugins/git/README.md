# Git — Herramientas de Control de Versiones

Habilidades de IA para tu negocio y proyectos que te ayudan a trabajar con git.

## Estructura

```
git/
├── .claude-plugin/
│   └── plugin.json           # Metadatos del plugin
└── skills/
    └── commit/
        └── SKILL.md          # Commits bien estructurados
```

## Habilidades Disponibles

### `/git:commit` — Commits Consistentes

Crea commits de git con mensajes bien estructurados siguiendo Conventional Commits.

```text
/git:commit [mensaje]
```

**Características:**

- Mensajes en español por defecto
- Formato Conventional Commits (feat, fix, docs, etc.)
- Analiza cambios automáticamente si no se proporciona mensaje
- Nunca hace push automático

**Tipos de commit:**

| Tipo | Descripción |
|------|-------------|
| `feat` | Nueva funcionalidad |
| `fix` | Corrección de bug |
| `docs` | Solo documentación |
| `style` | Formato, sin cambio de código |
| `refactor` | Reestructuración sin cambio de comportamiento |
| `perf` | Mejora de rendimiento |
| `test` | Añadir o corregir tests |
| `chore` | Build, config, dependencias |
| `ci` | Cambios de CI/CD |

## Requisitos

- **git** — Sistema de control de versiones

## Uso

```text
/git:commit
-> Analiza cambios staged y crea un commit convencional

/git:commit add user authentication
-> Crea: feat(auth): añade autenticación de usuario

/git:commit fix login redirect bug
-> Crea: fix(auth): corrige bug de redirección en login
```

## Reglas de Seguridad

1. **Nunca usa `git add -A`** — staged archivos específicos
2. **Nunca hace commit de secretos** — omite `.env`, credenciales
3. **Nunca hace push automático** — solo commit, el usuario hace push
4. **Nunca salta hooks** — deja que pre-commit hooks se ejecuten

## Más Información

Para contribuir o reportar problemas, visita el [repositorio principal](https://github.com/Jacopalas/agentic-ai-palas).
