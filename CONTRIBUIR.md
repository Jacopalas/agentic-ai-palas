# Contribuir a Palas

¡Gracias por querer contribuir! Palas se centra en **herramientas genéricas** y **habilidades de dominio** para particulares y pequeñas empresas.

## Nuestro Enfoque

La mayoría de plugins de Claude Code están orientados a desarrolladores. Nosotros somos diferentes:

- **Herramientas genéricas** — Útiles en cualquier proyecto (commits, formato, seguridad)
- **Habilidades de dominio** — Funciones de negocio como finanzas, RRHH, marketing, ventas, legal
- **Para PYMEs** — Herramientas prácticas para equipos pequeños sin departamento de IT

## Lo Que Buscamos

### Herramientas Genéricas

Habilidades que funcionen en cualquier proyecto:

- **Productividad**: Gestión de tareas, toma de notas, documentación
- **Calidad**: Formato, validación, consistencia
- **Seguridad**: Escaneo, auditoría, cumplimiento
- **Utilidades**: Procesamiento de archivos, transformación de datos

### Habilidades de Dominio (Alta Prioridad)

Especialmente buscamos habilidades para dominios de negocio:

| Dominio | Ideas de Habilidades |
|---------|----------------------|
| **Finanzas** | `/palas:invoice` — Generar/revisar facturas |
| | `/palas:budget` — Analizar presupuestos y previsiones |
| | `/palas:expense-report` — Crear informes de gastos |
| **Marketing** | `/palas:seo-review` — Revisar contenido para SEO |
| | `/palas:social-post` — Crear posts para redes sociales |
| | `/palas:newsletter` — Estructurar newsletters |
| **RRHH** | `/palas:job-description` — Redactar descripciones de puesto |
| | `/palas:onboarding` — Crear checklists de incorporación |
| | `/palas:policy` — Revisar/redactar políticas internas |
| **Ventas** | `/palas:proposal` — Estructurar propuestas comerciales |
| | `/palas:followup` — Redactar emails de seguimiento |
| | `/palas:meeting-notes` — Resumir reuniones con clientes |
| **Legal** | `/palas:contract-review` — Revisar contratos básicos |
| | `/palas:compliance` — Checklists de cumplimiento |
| | `/palas:nda` — Generar NDAs sencillos |

**¿No ves tu dominio?** También buscamos habilidades para contabilidad, operaciones, atención al cliente, gestión de proyectos y más.

---

## Cómo Contribuir

### 1. Fork y clonar

```bash
git clone https://github.com/TU_USUARIO/agentic-ai-palas.git
cd agentic-ai-palas
```

### 2. Crear una rama

```bash
git checkout -b add-nombre-de-tu-skill
```

### 3. Añadir tu habilidad

Crea un directorio en `skills/` con un archivo `SKILL.md`:

```text
skills/
└── nombre-de-tu-skill/
    └── SKILL.md
```

Si tu habilidad necesita scripts, añádelos en un subdirectorio `scripts/`.

### 4. Seguir el formato de habilidad

```markdown
---
name: nombre-de-tu-skill
description: Descripción breve. Use when the user wants to [trigger phrases en inglés y español].
---

# /palas:nombre-de-tu-skill — Título

Qué hace esta habilidad.

## Usage

/palas:nombre-de-tu-skill [argumentos]

**Arguments:**

- `arg1` (Required/Optional): Descripción

## Behavior

1. Paso uno
2. Paso dos
3. Paso tres

## Examples

/palas:nombre-de-tu-skill ejemplo
-> Resultado esperado

## Notes

- Consideraciones importantes
```

> **Nota sobre idiomas:** El contenido interno del SKILL.md (instrucciones que ejecuta Claude) debe estar en inglés para máxima fiabilidad. Las trigger phrases deben ser bilingües.

### 5. Probar tu habilidad

```bash
claude --plugin-dir .
```

Luego prueba `/palas:nombre-de-tu-skill` para verificar que funciona.

### 6. Enviar un PR

```bash
git add .
git commit -m "feat: add nombre-de-tu-skill skill"
git push origin add-nombre-de-tu-skill
```

Abre un PR explicando:

- Qué hace la habilidad
- Por qué es útil (especialmente para PYMEs)
- Cómo la has probado

---

## Directrices

### Sí

- Mantén las habilidades enfocadas en una tarea
- Escribe pensando en usuarios no técnicos
- Incluye instrucciones de uso claras
- Prueba antes de enviar
- Piensa en casos de uso para PYMEs

### No

- Incluir datos sensibles (API keys, tokens, rutas personales)
- Requerir servicios de pago caros
- Asumir conocimientos técnicos
- Duplicar funcionalidad existente
- Crear flujos excesivamente complejos

---

## Añadir Dependencias

Si tu habilidad necesita paquetes de Python o Node.js:

1. **Python**: Añadir a `_tooling/requirements.txt`
2. **Node.js**: Añadir a `_tooling/package.json`

Incluye instrucciones de configuración en tu SKILL.md.

---

## Nombrado de Archivos

- Usa minúsculas con guiones: `revision-facturas/SKILL.md`
- Sé descriptivo: `analisis-presupuesto` en lugar de `presupuesto`
- El nombre del directorio debe coincidir con el name en el frontmatter

---

## ¿Preguntas?

Abre un [issue](https://github.com/Jacopalas/agentic-ai-palas/issues).

---

¡Gracias por contribuir a Palas!
