# Palas-Security — Escaneo de Seguridad

Habilidades de IA para tu negocio y proyectos relacionadas con seguridad.

## Estructura

```
palas-security/
├── .claude-plugin/
│   └── plugin.json           # Metadatos del plugin
└── skills/
    └── security-scan/
        └── SKILL.md          # Escaneo básico de seguridad
```

## Habilidades Disponibles

### `/palas-security:security-scan` — Escaneo de Seguridad

Escanea el código buscando problemas de seguridad comunes.

```text
/palas-security:security-scan [objetivo]
```

**Detecta:**

- Secretos expuestos (API keys, contraseñas, tokens)
- Archivos peligrosos (.env, credenciales, claves privadas)
- Patrones de código riesgosos (eval, innerHTML, SQL injection)

**Niveles de severidad:**

| Nivel | Ejemplos |
|-------|----------|
| Crítico | Claves privadas, credenciales AWS, contraseñas de BD |
| Advertencia | API keys genéricas, uso de eval, exposición de .env |
| Info | Posibles falsos positivos, sugerencias de mejora |

## Requisitos

- **ripgrep** — Para búsqueda rápida de patrones

## Uso

```text
/palas-security:security-scan
-> Escanea el directorio actual

/palas-security:security-scan src/
-> Escanea solo el directorio src/

/palas-security:security-scan package.json
-> Revisa un archivo específico
```

## Limitaciones

Este es un escaneo **básico**. Para seguridad completa:

- Usa herramientas dedicadas (Snyk, Dependabot, Trivy)
- Ejecuta auditorías de dependencias (`npm audit`, `pip-audit`)
- Realiza pruebas de penetración
- Sigue las guías de OWASP

## Más Información

Para contribuir o reportar problemas, visita el [repositorio principal](https://github.com/Jacopalas/agentic-ai-palas).
